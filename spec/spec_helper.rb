$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'octopusci/server'
require 'rack/test'

Octopusci::Server.set :environment, :test

def app
  Octopusci::Server
end

include Rack::Test::Methods

# MAIL_TEMPLATE_PATH = File.join(File.dirname(File.dirname(__FILE__)), 'lib', 'octopusci', 'notifier')
# ActionMailer::Base.view_paths = MAIL_TEMPLATE_PATH
# "/Users/keyvan/Code/octopusci/lib/notifier/job_complete.html.erb"
RSpec.configure do |config|
  config.before(:each) do
    # Here I mock the Resque redis method to prevent the tests from actually storing any data in redis
  	@mock_redis = mock('redis')
  	Resque.stub(:redis).and_return(@mock_redis)
  end
end
