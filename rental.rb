class Rental
  attr_accessor :date, :book, :person, :id

  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end

  def to_json(*args)
    { person: @person, book: @book, date: @date }.to_json(*args)
  end
end
