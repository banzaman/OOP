require 'rspec'
require_relative '../person'
require_relative '../book'
require_relative '../rental'
require_relative '../student'
require_relative '../teacher'
require 'json'

describe Person do
  context '#initialize' do
    it 'creates a new Person object' do
      person = Person.new(20, 'John', parent_permission: true)
      expect(person).to be_a(Person)
    end
  end

  context '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        person = Person.new(25, 'John')
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is underage but has parent permission' do
      it 'returns true' do
        person = Person.new(17, 'John', parent_permission: true)
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is underage and does not have parent permission' do
      it 'returns false' do
        person = Person.new(17, 'John', parent_permission: false)
        expect(person.can_use_services?).to eq(false)
      end
    end
  end

  context '#correct_name' do
    it 'returns the name attribute' do
      person = Person.new(20, 'John', parent_permission: true)
      expect(person.correct_name).to eq('John')
    end
  end

  context '#add_rental' do
    it 'creates a new Rental object' do
      person = Person.new(20, 'John', parent_permission: true)
      book = Book.new('Harry Potter', 'J.K Rowling')
      date = '2023-04-20'
      rental = person.add_rental(book, date)
      expect(rental).to be_a(Rental)
    end
  end
end
