# frozen_string_literal: true

require './person'
# Define student
class Student < Person
  def initialize(classroom)
    super()
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
