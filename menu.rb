class Menu
  attr_reader :menu_exit

  def initialize(app)
    @menu_exit = 7
    @app = app
  end

  def display_options
    puts '
        Please choose an option by entering a number

          1 - List all books
          2 - List all people
          3 - Create a person
          4 - Create a book
          5 - Create a rental
          6 - List all rentals for a given person id
          7 - Exit'
  end

  def choose(choice)
    case choice
    when 1 then @app.list_books
    when 2 then @app.list_people
    when 3 then @app.create_person
    when 4 then @app.create_book
    when 5 then @app.create_rental
    when 6 then @app.list_rentals
    end
  end
end
