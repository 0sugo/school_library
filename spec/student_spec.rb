require 'spec_helper'

class Classroom
  attr_reader :name, :students

  def initialize(name)
    @name = name
    @students = []
  end
end

describe Student do
  before :each do
    @student = Student.new("one", 12, "Mark")
  end

  context "When student created" do
    it "will instantiate a student object" do
      expect(@student).to be_an_instance_of(Student)
    end
    it "will have a classroom attribute" do
      expect(@student.classroom).to eq("one")
    end
  end

  context "When setting the classroom" do
    it "will update the classroom attribute" do
      @student.classroom = "two"
      expect(@student.classroom).to eq("two")
    end

    it "will add the student to the new classroom" do
      classroom = Classroom.new("one")
      @student.classroom = classroom
      expect(classroom.students).to include(@student)
    end

    it "will not add the student to the same classroom again" do
      classroom = Classroom.new("one")
      @student.classroom = classroom
      expect { @student.classroom = classroom }.not_to(change { classroom.students.length })
    end
  end

  context "When play_hooky is called" do
    it "should return the play hooky message" do
      expect(@student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
