
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
  @projects = Project.all
  erb(:projects)
end


post ('/projects') do
  example = Project.new({:title=>"no title", :id=>0})
  projectname = params.fetch("projectname")
  addproject = Project.new({:title=>projectname, :id=>0})
  addproject.save
  @projects = Project.all
  erb(:projects)
end

post ('/projects') do
  example = Project.new({:title=>"no title", :id=>0})
  projectname = params.fetch("projectname")
  addproject = Project.new({:title=>projectname, :id=>0})
  addproject.save
  @projects = Project.all
  erb(:projects)
end
