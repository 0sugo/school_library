require_relative 'person'
# Define student
class Student < Person
  attr_accessor :name, :classroom
  def initialize(classroom)
    super()
    @name = name
    @classroom = nil
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
