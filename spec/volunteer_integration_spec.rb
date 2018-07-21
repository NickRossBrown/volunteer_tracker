require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the project creation path', {:type => :feature} do
  it 'takes the user from the homepage to the project page' do
    visit '/'
    click_link('Click Here to View Projects')
    expect(page).to have_content('Projects Webpage')
  end
end

describe 'the project creation feature', {:type => :feature} do
  it 'create a project on the the profile page' do
    visit '/projects'
    fill_in('projectname', :with => 'Teaching Kids to Code')
    click_button('Add A Project')
    expect(page).to have_content('Teaching Kids to Code')
  end
end

describe 'the project update feature', {:type => :feature} do
  it 'allows a user to change the name of the project on the the profile page' do
    test_project = Project.new({:title => 'Teaching Kids to Code', :id => nil})
    test_project.save
    visit '/projects'
    fill_in('renameproject', :with => 'Teaching Ruby to Kids')
    click_button('Update A Project')
    expect(page).to have_content('Teaching Ruby to Kids')
  end
end


describe 'the project delete feature', {:type => :feature} do
  it 'allows a user to delete a project on the the profile page' do
    test_project = Project.new({:title => 'Teaching Kids to Code', :id => nil})
    test_project.save
    project_id = test_project.id
    visit "/projects"
    click_button('Delete A Project')
    expect(page).not_to have_content("Teaching Kids to Code")
  end
end

describe 'the volunteer creation feature', {:type => :feature} do
  it 'takes the user from the homepage to the volunteer page' do
    visit '/'
    click_link('Click here to view Volunteers')
    expect(page).to have_content('Volunteer Webpage')
  end
end

describe 'the volunteer creation feature', {:type => :feature} do
  it 'takes the user to the profile page where they can create a volunteer' do
    visit '/volunteers'
    fill_in('volunteername', :with => 'franz ferdinand')
    click_button('Add A volunteer')
    expect(page).to have_content('franz ferdinand')
  end
end

describe 'the volunteer update feature', {:type => :feature} do
  it 'allows a user to change the name of the volunteer' do
    test_volunteer = Volunteer.new({:title => 'franz ferdinand', :id => nil})
    test_volunteer.save
    visit '/volunteers'
    fill_in('renamevolunteer', :with => 'France Ferdin')
    click_button('Update A volunteer')
    expect(page).to have_content('France Ferdin')
  end
end

describe 'the volunteer delete feature', {:type => :feature} do
  it 'allows a user to delete a volunteer' do
    test_volunteer = Volunteer.new({:title => 'franz ferdinand', :id => nil})
    test_volunteer.save
    volunteer_id = test_volunteer.id
    visit "/volunteers"
    click_button('Delete A volunteer')
    expect(page).not_to have_content("franz ferdinand")
  end
end
describe 'the assign a volunteer to a project feature', {:type => :feature} do
  it 'assings project_id to a volunteer' do
    test_volunteer = Volunteer.new({:name => 'franz ferdinand', :id => nil})
    test_volunteer.save
    test_project = Project.new({:title => 'Teaching Kids to Code', :id => 3})
    test_project.save
    visit "/volunteers"
    select('franz ferdinand', :from => "volunteer_assign")
    select('Teaching Kids to Code', :from => "project_assign")
    click_button('Add volunteer to Project')
    expect(page).not_to have_content("Yes")
  end
end
