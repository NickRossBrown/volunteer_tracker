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
       self
     end

     def self.all
       self
     end

     def save
       self
     end

     def find
      result = DB.exec("SELECT * FROM volunteer WHERE id = #{id};")
      name = result.first().fetch("name")
      Volunteer.new({:name => name, :id => id})
     end

     def project_id
       self
     end



end
