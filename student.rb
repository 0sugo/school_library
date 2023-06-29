require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    if classroom.is_a?(Classroom)
      @classroom = classroom
      classroom.students << self unless classroom.students.include?(self)
    else
      @classroom = classroom
    end
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
