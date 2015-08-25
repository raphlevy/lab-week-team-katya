require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/lab_week_#{env}")

# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")
require './lib/models/user'
require './lib/models/task'

DataMapper.finalize

DataMapper.auto_upgrade!
