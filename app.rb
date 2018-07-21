
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
  @volunteers = Volunteer.all
  erb(:projects)
end

post ('/projects') do
  example = Project.new({:title=>"no title", :id=>0})
  projectname = params.fetch("projectname")
  addproject = Project.new({:title=>projectname, :id=>0})
  addproject.save
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:projects)
end

get ('/projects/delete') do
  project_id = params.fetch("project_delete")
  project=Project.find(project_id)
  project.delete
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:projects)
end

get ('/projects/update') do
  project_id = params.fetch("projects_update")
  new_project_name = params.fetch("renameproject")
  project=Project.find(project_id)
  project.update(new_project_name )
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:projects)
end

get('/volunteers') do
  @volunteers = Volunteer.all
  @projects = Project.all
  erb(:volunteers)
end

post ('/volunteers') do
  volunteername = params.fetch("volunteername")
  addvolunteer = Volunteer.new({:name=>volunteername})
  addvolunteer.save
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:volunteers)
end

get ('/volunteers/delete') do
  volunteer_id = params.fetch("volunteer_delete")
  volunteer=Volunteer.find(volunteer_id)
  volunteer.delete
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:volunteers)
end

get ('/volunteers/update') do
  volunteer_id = params.fetch("volunteer_update")
  new_volunteer_name = params.fetch("renamevolunteer")
  volunteer=Volunteer.find(volunteer_id)
  volunteer.update(new_volunteer_name )
  @volunteers = Volunteer.all
  @projects = Project.all
  erb(:volunteers)
end

get ('/volunteers/projectassign') do
  @volunteers = Volunteer.all
  @projects = Project.all
  volunteer_id = params.fetch("volunteer_assign")
  project_id = params.fetch("project_assign")
  volunteer=Volunteer.find(volunteer_id)
  volunteer.update_project_id(project_id)
  erb(:volunteers)
end
