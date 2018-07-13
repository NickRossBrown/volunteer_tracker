
require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
also_reload('lib/**/*.rb')
require("pg")
require ('pry')
DB = PG.connect({:dbname => "volunteer_tracker"})

get ('/') do
  erb(:index)
end

get('/projects') do
  erb(:projects)
end


post ('/projects') do
  example = Project.new({:title=>"no title", :id=>0})
  @projects_list = Project.new({:title=>"no title", :id=>0})
  # @projects = Project.all

  erb(:all_projects)
end
