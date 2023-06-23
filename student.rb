require_relative 'person'
# Define student
class Student < Person
  attr_accessor :name, :classroom

  def initialize(_classroom)
    super()
    @name = name
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
