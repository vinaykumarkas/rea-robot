=begin
Spec helper class.
=end


require_relative '../lib/helpers/robot.rb'
require_relative '../lib/helpers/table.rb'
require_relative '../lib/helpers/controller.rb'

RSpec.configure do |configure|
  configure.mock_with :rspec do |config|
    config.syntax = [:expect, :should]
  end
end
