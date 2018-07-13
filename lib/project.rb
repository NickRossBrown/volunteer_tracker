class Project
  attr_reader :id
  attr_accessor :title

  def initialize (parameters)
    @title = parameters.fetch(:title, "UNDEFINED TITLE")
    @id = parameters.fetch(:id, nil)
  end

  def ==(another_project)
    self.title().==(another_project.title()).&(self.id().==(another_project.id()))
  end

  def self.all
    all_projects = DB.exec("SELECT * FROM project;")
    projects = []
    all_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i()
      projects.push(Project.new({:title => title, :id => id, }))
    end
    projects
  end

  def save
  result = DB.exec("INSERT INTO project (title) VALUES ('#{@title}') RETURNING id;")
  @id = result.first().fetch("id").to_i()
  end

  def self.find(id)
   result = DB.exec("SELECT * FROM project WHERE id = #{id};")
   title = result.first().fetch("title")
   Project.new({:title => title, :id => id})
 end

  def volunteers
    self
  end

  def update (new_title)
    @id = id
    @title = new_title

    DB.exec("UPDATE project SET title = '#{new_title}' WHERE id = '#{@id}';")
  end

  def delete
    self
  end


end
