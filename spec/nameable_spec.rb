require 'rspec'

require_relative '../nameable'

RSpec.describe Nameable do
  describe '#correct_name' do
    it 'raises NotImplementedError' do
      nameable = described_class.new
      expect do
        nameable.correct_name
      end.to raise_error(NotImplementedError, 'Subclasses must implement the correct_name method.')
    end
  end
end
