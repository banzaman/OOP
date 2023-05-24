require 'rspec'
require_relative '../book'
require_relative '../rental'
require_relative '../person'
require 'json'

describe Book do
  describe '#initialize' do
    it 'creates a new Book object' do
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      expect(book).to be_an_instance_of(Book)
    end

    it 'sets the title and author attributes' do
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      expect(book.title).to eq('The Hobbit')
      expect(book.author).to eq('J.R.R. Tolkien')
    end

    it 'sets the rentals attribute to an empty array' do
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rental' do
    it 'creates a new Rental object' do
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      person = Person.new(20, 'John')
      date = '2023-04-20'
      rental = book.add_rental(person, date)
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'adds the new rental to the rentals attribute' do
      book = Book.new('The Hobbit', 'J.R.R. Tolkien')
      person = Person.new(20, 'John')
      date = '2023-04-20'
      rental = book.add_rental(person, date)
      expect(book.rentals).to include(rental)
    end
  end
end
