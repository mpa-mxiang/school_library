require_relative '../base_decorator'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'
require_relative '../nameable'

RSpec.describe BaseDecorator do
  let(:baseDecorator) { BaseDecorator.new('benja') }

  describe '#initialize' do
    it 'creates a new base decorator and returns the name given' do
      expect(baseDecorator.correct_name).to eq('benja')
    end
  end
end

RSpec.describe CapitalizeDecorator do
  let(:baseDecorator) { BaseDecorator.new('benja') }
  let(:capitalizeDecorator) { CapitalizeDecorator.new(baseDecorator) }

  describe '#initialize' do
    it 'creates a new capitalize decorator and returns the name given with a capital letter' do
      expect(capitalizeDecorator.correct_name).to eq('Benja')
    end
  end
end

RSpec.describe BaseDecorator do
  let(:baseDecorator) { BaseDecorator.new('benja') }
  let(:capitalizeDecorator) { CapitalizeDecorator.new(baseDecorator) }
  let(:trimmerDecorator) { TrimmerDecorator.new(baseDecorator) }

  describe '#initialize' do
    it 'creates a new trimmer decorator and returns the name given unless length is more than 10' do
      expect(trimmerDecorator.correct_name).to eq('benja')
    end
  end
end
