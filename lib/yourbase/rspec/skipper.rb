
begin
  puts "Loading YourBase RSpec accelerator..."
  require 'yourbase_test_skipper'
rescue => e
  puts "Unable to load RSpec accelerator with error: #{e}"
end
