$:.unshift(File.expand_path('../../lib', __FILE__))
require 'yourbase_rspec_skipper'

RSpec.configure do |config|
  config.mock_with :rspec
end
