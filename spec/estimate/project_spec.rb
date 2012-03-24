require 'spec_helper'

describe Estimate::Project do

  context 'properties' do
    it '#developers' do
      project = Estimate::Project.new(:project_name, :developers => 5)
      project.stub(:project => mock_pivotal_project)

      3.times { project.should_receive(:developers).and_return(5) }

      project.process!
    end

    it '#day_points' do
      project = Estimate::Project.new(:project_name, :day_points => 2)
      project.stub(:project => mock_pivotal_project)

      project.should_receive(:day_points).and_return(2)

      project.process!
    end
  end

  it 'can estimate the project end date' do
    number_of_stories = 10

    project = Estimate::Project.new(:project_name)
    mock_incomplete_stories(project, number_of_stories)

    end_date = (DateTime.now + 7*7).strftime('%A, %b %d %Y')

    project.process!.should eq process_string(:project_name, number_of_stories, end_date)
  end
end
