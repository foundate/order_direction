require 'active_record'
require 'database_cleaner'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => "spec/test.sqlite3"
)