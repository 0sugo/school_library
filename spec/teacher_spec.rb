require 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(12,"Mark","math")
  end

  context "When instanciated" do
    it "will create an instance of Teacher" do
      expect(@teacher).to be_an_instance_of(Teacher)
    end
  end
  context "When instanciated" do
    it "will return boolean" do
      @services = @teacher.can_use_service?
      expect(@services).to be_truthy
    end
  end
end
