require 'spec_helper'

describe Decorator do
  let(:nameable) { double('nameable') }
  let(:decorator) { Decorator.new(nameable) }

  describe '#initialize' do
    it 'assigns the nameable object' do
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'calls the correct_name method on the nameable object' do
      expect(nameable).to receive(:correct_name).and_return('John Doe')
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
