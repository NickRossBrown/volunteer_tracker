class Volunteer
  attr_reader :id, :project_id
  attr_accessor :name
  def initialize (args)
    args = defaults.merge(args)
    @name = args[:name]
    @id = args[:id]
    @project_id = args[:project_id]
   end

   def defaults
     {:name=>"NONE", :id=> 0, :project_id=>0}
   end


   def ==(another_volunteer)
     self.name().==(another_volunteer.name()).&(self.id().==(another_volunteer.id()))
   end

   def self.all
     all_volunteers =  DB.exec("SELECT * FROM volunteers;")
     volunteers=[]
     all_volunteers.each() do |person|
       name = person.fetch("name")
       id = person.fetch("id").to_i
       project_id = person.fetch("project_id").to_i
       volunteers.push(Volunteer.new({:name=> name, :id=> id, :project_id=>project_id}))
     end
     volunteers
   end

   def save
     result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}','#{@project_id}') RETURNING id;")
     @id = result.first().fetch("id").to_i()
   end

   def self.find(id)
    result = DB.exec("SELECT * FROM volunteers WHERE id = #{id};")
    name = result.first().fetch("name")
    Volunteer.new({:name => name, :id => id})
   end

   def delete
     DB.exec("DELETE FROM volunteers WHERE id='#{@id}';")
   end

   def update (new_name)
     @id = id
     DB.exec("UPDATE volunteers SET name = '#{new_name}' WHERE id='#{@id}';")
   end

   def update_project_id (assign_project_id)
     @id = id
     @project_id = assign_project_id.to_i
     DB.exec("UPDATE volunteers SET project_id = '#{@project_id }' WHERE id='#{@id}';")
   end

end
