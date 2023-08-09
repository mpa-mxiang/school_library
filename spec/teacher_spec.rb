require_relative '../teacher'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(35, 'Math', name: 'John Doe') }

  describe '#initialize' do
    it 'creates a new teacher with the given age, specialization, and name' do
      expect(teacher.age).to eq(35)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.name).to eq('John Doe')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
