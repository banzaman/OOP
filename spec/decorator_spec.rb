require 'rspec'
require_relative '../person'
require_relative '../decorator'

describe 'Decorators' do
  describe 'Capitalize name decorator' do
    it 'creates a new Person object and capitalizes name' do
      person = Person.new(20, 'maximilianus')
      capitalize = CapitalizeDecorator.new person
      expect(person.correct_name).to eq('maximilianus')
      expect(capitalize.correct_name).to eq('Maximilianus')
    end
  end

  describe 'trimm name decorator' do
    it 'creates a new Person object and trimms name to 10 characters' do
      person = Person.new(20, 'maximilianus')
      capitalize = TrimmerDecorator.new person
      expect(person.correct_name).to eq('maximilianus')
      expect(capitalize.correct_name).to eq('maximilian')
    end
  end

  describe 'Combined name decorators' do
    it 'creates a new Person object and capitalizes name' do
      person = Person.new(20, 'maximilianus')
      capitalize = CapitalizeDecorator.new person
      capitalize = TrimmerDecorator.new capitalize
      expect(person.correct_name).to eq('maximilianus')
      expect(capitalize.correct_name).to eq('Maximilian')
    end
  end
end
