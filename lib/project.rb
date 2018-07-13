class Project
  attr_reader :id
  attr_accessor :title

  def initialize (parameters)
    @title = parameters.fetch(:title, "UNDEFINED TITLE")
    @id = parameters.fetch(:id, nil)
  end

  def ===
    self
  end

  def self.all
    self
  end

  def save
    self
  end

  def find
    self
  end

  def volunteers
    self
  end

  def update
    self
  end

  def delete
    self
  end


end
