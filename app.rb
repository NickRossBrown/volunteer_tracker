
require('sinatra')
require('sinatra/reloader')
require('./lib/patron')
require('./lib/book')
also_reload('lib/**/*.rb')
require("pg")
require ('pry')
DB = PG.connect({:dbname => "volunteer_tracker"})

get ('/') do
  erb(:index)
end
