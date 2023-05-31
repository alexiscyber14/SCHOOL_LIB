require 'rspec'
require_relative '../decorator'
require_relative '../trim_decorator'

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'trims the name to the first 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('Long Name Here')
      expect(decorator.correct_name).to eq('Long Name ')
    end
  end
end
