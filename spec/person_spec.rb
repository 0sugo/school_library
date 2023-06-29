require 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(12,"Mark")
  end
  context "When instanciated" do
    it "will create an instance of person" do
      expect(@person).to be_an_instance_of(Person)
    end
  end
  context "when can_use_services is called on person" do
    it "will return boolean on if they have parent permision  or are of age" do
      answer = @person.can_use_service?
      expect(answer).to be_truthy
  end
end
  context "Will correct_name is called" do
    it "Will return the persons name" do
      available_name = @person.correct_name
      expect(available_name).to eq("Mark")
    end
  end
  context "When add_rentals is called" do
    it "Will add it as rentals instance" do
      @book_immitation = Book.new("Kisimo","Author")
      @rent = @person.add_rental(@book_immitation,"12-12-2023")
      expect(@rent).to be_an_instance_of (Rental)
    end
  end
end
