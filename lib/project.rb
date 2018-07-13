class Project
  attr_reader :id
  attr_accessor :title
  def initialize (parameters)
    @title = parameters.fetch(:title, "UNDEFINED TITLE")
    @id = parameters.fetch(:title, 0)


end
