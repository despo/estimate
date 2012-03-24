require 'pivotal-tracker'

module Estimate
  class Project

    def initialize name, properties={}
      @name = name
      @properties = properties
    end

    def process!
  """
  Project: #{@name}
  Incomplete stories: #{incomplete_stories.length}

  And your project end date is.....
            #{display_end_date}

  You have #{remaining_days} days to complete this project.
  """
    end

    private
    WORK_WEEK_DAYS = 5
    HOLIDAYS_PER_DEVELOPER = 5
    DEFAULT_DAY_POINTS = 1
    DEFAULT_DEVELOPERS = 2

    def incomplete_stories
      @stories = @stories || project.stories.all(:story_type => story_points.keys, :current_state => incomplete_stati)
    end

    def project
      @project = @project || PivotalTracker::Project.all.select { |x| x.name.eql? @name }.first
    end

    def story_points
      { :feature => 5,
        :bug => 1,
        :chore => 1
      }
    end

    def incomplete_stati
      [ 'unscheduled', 'unstarted', 'started' ]
    end

    def display_end_date
      end_date.strftime('%A, %b %d %Y')
    end

    def end_date
      DateTime.now + remaining_weeks*7
    end

    def remaining_weeks
      @remaining_weeks = @remaining_weeks || (points/day_points+holidays*developers)/WORK_WEEK_DAYS/developers
    end

    def points
      incomplete_stories.inject(0) { |points, story|  points + story_points[story.story_type.to_sym] }
    end

    def day_points
      @properties[:day_points] || DEFAULT_DAY_POINTS
    end

    def holidays
      HOLIDAYS_PER_DEVELOPER*developers
    end

    def developers
      @properties[:developers] || DEFAULT_DEVELOPERS
    end

    def remaining_days
      (end_date-DateTime.now).to_i
    end

  end
end
