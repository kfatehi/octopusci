require 'time-ago-in-words'

require 'octopusci/version'
require 'octopusci/errors'
require 'octopusci/helpers'
require 'octopusci/io'
require 'octopusci/job_store'
require 'octopusci/notifier'
require 'octopusci/queue'
require 'octopusci/stage_locker'
require 'octopusci/job'
require 'octopusci/config'
require 'octopusci/worker_launcher'

module Octopusci
  def self.root
    Pathname.new File.dirname(File.dirname(File.expand_path(__FILE__)))
  end
end