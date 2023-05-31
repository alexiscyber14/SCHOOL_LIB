require 'rspec'
require_relative '../decorator'
require_relative '../nameable'

RSpec.describe Decorator do
  let(:nameable_object) { double('Nameable') }
  let(:decorator) { described_class.new(nameable_object) }

  describe '#initialize' do
    it 'takes a nameable object as a parameter and initializes the decorator' do
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable_object)
    end
  end

  describe '#correct_name' do
    it 'delegates the correct_name method call to the nameable object' do
      expect(nameable_object).to receive(:correct_name)
      decorator.correct_name
    end
  end
end
