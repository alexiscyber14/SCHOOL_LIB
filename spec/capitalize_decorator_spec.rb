require 'rspec'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  let(:decorated_object) { double('DecoratedObject') }
  let(:decorator) { described_class.new(decorated_object) }

  describe '#correct_name' do
    it 'capitalizes the name using the decorated object' do
      allow(decorated_object).to receive(:correct_name).and_return('john doe')
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
