class Volunteer
  attr_reader :id, :project_id
  attr_accessor :name
  def initialize (args)
    args = defaults.merge(args)
    @name = :name
    @id = :id
    @project_id = :project_id
   end

   def defaults
     {:name=>"NONE", :id=> 0, :project_id=>0}     
   end

end
Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
expect(test_volunteer.name).to eq 'Jane'
