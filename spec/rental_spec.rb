require 'spec_helper'

describe Book do
  before :each do
    @book_prot = Book.new("Kadamnasi", "Oloo")
    @person = Person.new(25, "John")
  end

  context "When initialised" do
    it "Will create a book object" do
      expect(@book_prot).to be_an_instance_of(Book)
    end

    it "creates a rentals instance" do
      supposed_rental = @book_prot.add_rental(@person, "12-12-2023")
      expect(supposed_rental).to be_an_instance_of(Rental)
    end
  end
end
