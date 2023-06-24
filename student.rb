require_relative 'person'
# Define student
class Student < Person
  attr_accessor :name, :classroomer

  def initialize(age, name, parent_permission)
    super(age, name, parent_permission: parent_permission)
  end

  def classroom(classroomer)
    @classroom = classroomer
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
