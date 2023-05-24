require './book'
require './person'
require './student'
require './teacher'
require './rental'
require 'json'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'No books found.' if @books.empty?
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    puts 'No person has registered yet.' if @people.empty?
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a Student (1) or a Teacher (2)? [Input number]: '
    person = gets.chomp.to_i

    case person
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid input. Please try again.'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission [Y/N]: '
    permission = gets.chomp.upcase

    case permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      puts "Invalid input. Please enter 'Y' or 'N'."
    end

    student = Student.new(age, name, parent_permission)
    @people << student

    puts 'Student created successfully.'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people << teacher

    puts 'Teacher created successfully.'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully.'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i

    print 'Date [MM/DD/YYYY]: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @people[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental created successfully.'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end

  # Data Preservation Methods ---

  def save_books(filename)
    File.write(filename, @books.to_json)
  end

  def save_people(filename)
    File.write(filename, @people.to_json)
  end

  def save_rentals(filename)
    File.write(filename, @rentals.to_json)
  end

  # Data Loading Methods ---

  def load_books(filename)
    if File.exist?(filename)
      @books = JSON.parse(File.read(filename)).map do |b|
        Book.new(b['title'], b['author'])
      end
    else
      File.write(filename, '[]')
    end
  end

  def load_people(filename)
    if File.exist?(filename)
      @people = JSON.parse(File.read(filename)).map do |p|
        if p['type'] == 'Student'
          Student.new(p['age'], p['name'], p['parent_permission'])
          # student.id = p['person_id']
        elsif p['type'] == 'Teacher'
          Teacher.new(p['age'], p['name'], p['specialization'])
        end
      end
    else
      File.write(filename, '[]')
    end
  end

  def load_rentals(filename)
    if File.exist?(filename)
      @rentals = JSON.parse(File.read(filename)).compact.map do |r|
        book = @books.find { |b| b.title == r['book']['title'] }
        person = @people.find { |p| p.name == r['person']['name'] }
        next if book.nil? || person.nil?

        Rental.new(r['date'], person, book)
      end
      @rentals.compact!
    else
      File.write(filename, '[]')
    end
  end
end
