require 'rubygems'
require 'bundler/setup'
require 'database'
require 'order_direction'
require 'pry'

RSpec.configure do |config|
  config.mock_with :rspec

  config.before(:suite) do
    DatabaseCleaner.clean_with :deletion
    DatabaseCleaner.strategy = :deletion
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end
end

