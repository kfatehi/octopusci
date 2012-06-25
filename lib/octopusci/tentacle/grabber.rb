module Octopusci
  module Tentacle
    module Grabber
      # This module is the entry point for remote jobs
      # it polls Octopus-CI Sinatra Web App using grab_next_job
      # and notifies of progress


      def self.grab_next_job
        # this is a polling method
        # GET <server>/queue results in an array of job data, after all
        jobs = []
        # how do we know where the server is?
        # point to the server on startup of tentacle?
        # --- anyway
        if jobs.empty? || Octopusci::Tentacle.busy?
          return
        else
          job = Octopusci::Tentacle::Job.new(jobs.first)
          job.accept if Octopusci::Tentacle.idle?
        end
      end

      def accept_job(job_data)

      end
    end
  end
end
