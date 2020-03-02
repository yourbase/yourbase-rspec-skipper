require 'rspec/core/rake_task'

module YourBase
  module RSpec
    module Skipper 
      @@injected = false

      def self.inject!
        unless @@injected
          ::YourBase::RSpec::Skipper.init!
          @@injected = true
        end
      end

    end
  end
end

module YourBase
  module RSpec
    module Skipper
      class RakeTask < ::RSpec::Core::RakeTask

         def run_task(verbose)
           puts "[YB] Running YourBase RSpec Rake task..."

           begin
             super(verbose)
           rescue 
           end

           if ::YourBase::RSpec::Skipper.initialized?
             begin
               ::YourBase::RSpec::Skipper.finish!
             rescue => e
               puts "[YB] Error finishing: #{e}"
             end
           end
         end

      end
    end
  end
end

begin
  using_rspec = false

  begin 
    require 'rspec'
    using_rspec = true
  rescue LoadError => e 
    puts "YourBase can't accelerate RSpec because it's not loaded!"
  end

  if using_rspec
    begin
      puts "Loading YourBase RSpec Skipper..."
      require 'yourbase_test_skipper'
      ::YourBase::RSpec::Skipper.inject!
    rescue LoadError => e
      puts "Failed to find or load RSpec accelerator, falling back to normal behavior"
      puts "Error: #{e}"
    end
  end

rescue => e
  puts "Unable to load RSpec accelerator: #{e}"
end

