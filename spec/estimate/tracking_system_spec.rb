require 'spec_helper'

describe Estimate::TrackingSystem do

  context 'can connect to the tracking system' do

    it 'can authenticate a user' do
      PivotalTracker::Client.should_receive(:token).with(:username, :password)
      Estimate::TrackingSystem.authenticate! :username, :password
    end

    it 'can authenticate when ssl authentication is enabled' do
      PivotalTracker::Client.should_receive(:token).with(:username, :password)
      PivotalTracker::Client.should_receive(:use_ssl=).with(true)

      Estimate::TrackingSystem.authenticate!(:username, :password, true)
    end
  end
end
