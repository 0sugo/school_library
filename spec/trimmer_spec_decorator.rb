require 'spec_helper'

describe TrimmerDecorator do
  let(:decorated_object) { double("Decorated Object") }

  describe "#correct_name" do
    it "returns the name trimmed to a maximum of 10 characters" do
      decorated_object_name = "This is a long name"
      expected_trimmed_name = "This is a"

      allow(decorated_object).to receive(:correct_name).and_return(decorated_object_name)

      decorator = TrimmerDecorator.new(decorated_object)
      trimmed_name = decorator.correct_name

      expect(trimmed_name).to eq(expected_trimmed_name)
    end

    it "returns the original name if it is already 10 characters or shorter" do
      decorated_object_name = "Short name"

      allow(decorated_object).to receive(:correct_name).and_return(decorated_object_name)

      decorator = TrimmerDecorator.new(decorated_object)
      trimmed_name = decorator.correct_name

      expect(trimmed_name).to eq(decorated_object_name)
    end
  end
end
