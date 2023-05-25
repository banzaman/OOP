require 'rspec'
require_relative '../teacher'

describe Teacher do
  context '#initialize' do
    it 'creates a new teacher object with the correct attributes' do
      teacher = Teacher.new(35, 'John Doe', 'Mathematics')
      expect(teacher).to be_an_instance_of(Teacher)
      expect(teacher.age).to eq(35)
      expect(teacher.name).to eq('John Doe')
      expect(teacher.specialization).to eq('Mathematics')
    end
  end

  context '#can_use_services?' do
    it 'returns true for a teacher' do
      teacher = Teacher.new(35, 'John Doe', 'Mathematics')
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
