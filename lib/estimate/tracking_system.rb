module Estimate

  class TrackingSystem
    def self.authenticate! username, password, ssl=nil
      PivotalTracker::Client.token(username, password)
      PivotalTracker::Client.use_ssl = true
    end
  end
end
