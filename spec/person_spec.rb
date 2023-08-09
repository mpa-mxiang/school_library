require_relative '../person'

RSpec.describe Person do
  describe '#initialize' do
    it 'creates a person object with the given age and name' do
      person = Person.new(25, name: 'John Doe')
      expect(person.age).to eq(25)
      expect(person.name).to eq('John Doe')
    end
  end

  describe '#can_use_services?' do
    it 'returns true by default' do
      person = Person.new(30)
      expect(person.can_use_services?).to be true
    end
  end
end
