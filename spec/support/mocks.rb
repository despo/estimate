def mock_incomplete_stories project, number_of_stories
  incomplete_stories = number_of_stories.times.map { mock_feature }

  2.times { project.should_receive(:incomplete_stories).and_return(incomplete_stories) }
end

def process_string name, incomplete_stories, end_date
  """
  Project: #{name}
  Incomplete stories: #{incomplete_stories}

  And your project end date is.....
            #{end_date}

  You have 48 days to complete this project.
  """
end

def mock_feature
  mock(:story_type => 'feature')
end

def mock_pivotal_project
  mock(:pivotal_project, :stories => mock(:all => []))
end
