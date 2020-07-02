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

begin
  using_rspec = false

  begin 
    require 'rspec/core'
    using_rspec = true
  rescue LoadError => e
    puts "YourBase can't accelerate RSpec because it's not loaded!"
    return
  end

  begin
    puts "Loading YourBase RSpec Skipper..."
    require 'yourbase_test_skipper'
    ::YourBase::RSpec::Skipper.inject!
  rescue LoadError => e
    puts "Failed to find or load RSpec accelerator, falling back to normal behavior"
  end

rescue => e
  puts "Unable to load RSpec accelerator: #{e}"
end
