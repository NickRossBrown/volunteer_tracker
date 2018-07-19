
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
  binding.pry
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

get ('/projects/delete') do

  project_id = params.fetch("project_delete")
  project=Project.find(project_id)
  project.delete
  @projects = Project.all
  erb(:projects)
end
get ('/projects/update') do


  project_id = params.fetch("projects_update")
  new_project_name = params.fetch("renameproject")
  project=Project.find(project_id)

  project.update(new_project_name )
  @projects = Project.all
  erb(:projects)
end
