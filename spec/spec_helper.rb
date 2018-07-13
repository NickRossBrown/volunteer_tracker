require "volunteer"
require "project"
require "rspec"
require "pry"
require "pg"

DB = PG.connect({:dbname => 'volunteer_tracker_epicodus'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM volunteer *;')
    DB.exec('DELETE FROM project *;')
  end
end
