require 'spec_helper'

describe ClassRoom do
  before :each do
    @classroom = ClassRoom.new('label')
  end

  context 'When an instance of classroom is instatiated' do
    it 'Will instantiate classroom' do
      expect(@classroom).to be_an_instance_of(ClassRoom)
    end
  end

  context 'When add students is called on a classroom object' do
    it 'Will add student to students array' do
      student = Student.new('one', 12, 'Joe')
      @classroom.add_students(student)
      expect(@classroom.students).to include(student)
    end
  end
end
