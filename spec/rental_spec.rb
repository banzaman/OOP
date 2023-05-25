require_relative '../rental'
require_relative '../book'
require_relative '../person'
require 'rspec'

describe Rental do
  context '#initialize' do
    it 'creates a new Rental object' do
      rental = Rental.new('2023-04-20', Person.new(18, 'John'), Book.new('Book Title', 'Author Name'))
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'sets the date attribute' do
      rental = Rental.new('2023-04-20', Person.new(18, 'John'), Book.new('Book Title', 'Author Name'))
      expect(rental.date).to eq('2023-04-20')
    end

    it 'sets the book attribute' do
      book = Book.new('Book Title', 'Author Name')
      rental = Rental.new('2023-04-20', Person.new(18, 'John'), book)
      expect(rental.book).to eq(book)
    end

    it 'sets the person attribute' do
      person = Person.new(18, 'John')
      rental = Rental.new('2023-04-20', person, Book.new('Book Title', 'Author Name'))
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book rentals attribute' do
      book = Book.new('Book Title', 'Author Name')
      rental = Rental.new('2023-04-20', Person.new(18, 'John'), book)
      expect(book.rentals).to include(rental)
    end

    it 'adds the rental to the person rentals attribute' do
      person = Person.new(18, 'John')
      rental = Rental.new('2023-04-20', person, Book.new('Book Title', 'Author Name'))
      expect(person.rentals).to include(rental)
    end
  end
end
