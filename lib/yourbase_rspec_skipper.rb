# == YourBaseRSpecSkipper Initialization
#
require 'rspec'

# Expand the pattern of specs to run and then run them 
# one by one with /skipper -- prefixed if skipper exists
# if skipper doesn't exist, just run them one-by one separately

module YourBaseRSpecCoreRakeTaskExtension
  def spec_command
    if File.exist? "/skipper"
      "/skipper -- rspec #{@pattern}"
    else 
      super
    end
  end

  def run_task(verbose)
    files = Dir.glob(@pattern)
    if files.size > 1 
      files.each do |f|
        puts "Running rspec with skipper for #{f}"
        task = self.clone
        task.pattern = f
        task.run_task(verbose)
      end
    else
      puts "Will run the one test normally"
      super(verbose)
    end
  end
  
end

module RSpec
  module Core
    class RakeTask
      prepend YourBaseRSpecCoreRakeTaskExtension
    end
  end
end 


