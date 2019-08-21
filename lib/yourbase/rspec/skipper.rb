require 'rspec'

# Expand the pattern of specs to run and then run them 
# one by one with /skipper -- prefixed if skipper exists
# if skipper doesn't exist, just run them one-by one separately

module YourBase
  module RSpec
    module Skipper 
      def self.init!
          ::RSpec::Core::RakeTask.prepend ::YourBase::RSpec::Skipper::CoreRakeTaskExtension
      end

      module CoreRakeTaskExtension

        # Run each of them for now; TBD: use the build-graph API 
        def fail_on_error
          false
        end 

        def spec_command
          if File.exist? "/skipper"
            "/skipper -- rspec #{@pattern.join ' '}"
          else 
            super
          end
        end

        def run_task(verbose)
          original_pattern = @pattern
          files = Dir.glob(@pattern).sort
          slice_size = [(files.size / 10) + 1, files.count].min
          puts "Will run specs in blocks of #{slice_size}"
          groups = files.each_slice(slice_size).to_a
          groups.each do |g|
            @pattern = g
            command = spec_command
            puts "Running rspec with skipper for #{g}..."
            puts command if verbose

            success = system(command)

            if !success and fail_on_error
              puts failure_message if failure_message
              exit $?.exitstatus || 1
            end
          end
        
        end
        
      end
    end
  end
end

#module RSpec
#  module Core
#    class RakeTask
#      prepend YourBase::RSpec::Skipper::CoreRakeTaskExtension
#    end
#  end
#end 


