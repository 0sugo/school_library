require_relative 'spec_helper'
require_relative 'capitalize_decorator'

describe CapitalizeDecorator do
  let(:base_decorator) { BaseDecorator.new('john doe') }
  let(:capitalize_decorator) { CapitalizeDecorator.new(base_decorator) }

  describe '#correct_name' do
    it 'capitalizes the name' do
      expect(capitalize_decorator.correct_name).to eq('John Doe')
    end

    it 'returns nil when the base decorator name is nil' do
      base_decorator = BaseDecorator.new(nil)
      capitalize_decorator = CapitalizeDecorator.new(base_decorator)

      expect(capitalize_decorator.correct_name).to be_nil
    end

    it 'returns nil when the base decorator name is an empty string' do
      base_decorator = BaseDecorator.new('')
      capitalize_decorator = CapitalizeDecorator.new(base_decorator)

      expect(capitalize_decorator.correct_name).to be_nil
    end
  end
end
