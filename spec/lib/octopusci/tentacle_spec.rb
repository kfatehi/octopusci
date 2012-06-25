require 'spec_helper'

describe Octopusci::Tentacle do
  describe Octopusci::Tentacle::Grabber do
    it "has a polling method to grab next job, if one exists" do
      Octopusci::Tentacle::Grabber.should respond_to :grab_next_job
    end
  end
end