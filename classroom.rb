# frozen_string_literal: true

# define book
class Classroom
  attr_accessor :label, :students
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
