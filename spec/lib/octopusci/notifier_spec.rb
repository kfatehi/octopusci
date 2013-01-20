require 'spec_helper'
require 'pry'

describe Octopusci::Notifier do
  before(:each) do
      Octopusci::Notifier.delivery_method = :test
      Octopusci::Notifier.perform_deliveries = true
      Octopusci::Notifier.deliveries = []
  end

  describe "#job_complete" do
    it "delivers a success email to me" do
      Octopusci::Notifier.job_complete({}, "keyvanfatehi@gmail.com", "success", true) #.deliver
      Octopusci::Notifier.deliveries.should_not be_empty
    end
      
# Failures:

#   1) Octopusci::Notifier#job_complete delivers a success email to me
#      Failure/Error: Octopusci::Notifier.job_complete({}, "keyvanfatehi@gmail.com", "success", true) #.deliver
#      ArgumentError:
#        wrong number of arguments (0 for 1)
#      # ./lib/octopusci/notifier.rb:21:in `block in job_complete'
#      # ./lib/octopusci/notifier.rb:20:in `job_complete'
#      # ./spec/lib/octopusci/notifier_spec.rb:13:in `block (3 levels) in <top (required)>'

  end
end