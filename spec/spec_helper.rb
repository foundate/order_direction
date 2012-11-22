require 'rubygems'
require 'bundler/setup'
require 'database'
require 'pry'
# require 'order_direction'
# require 'order_direction_helper'

require File.expand_path('../../lib/order_direction', __FILE__)

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

