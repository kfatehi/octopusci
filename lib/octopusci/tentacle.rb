require_relative 'tentacle/grabber'
require_relative 'tentacle/job'

module Octopusci
  module Tentacle
    attr_accessor :busy, :jobs, :remote_jobs

    def self.idle?
      !@busy
    end

    def self.busy?
      @busy
    end
  end
end