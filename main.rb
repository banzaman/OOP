# rubocop:disable Metrics/CyclomaticComplexity

require_relative './app'
require_relative './menu'

def main
  app = App.new
  menu = Menu.new

  puts '
  Welcome to School Library App!'

  loop do
    menu.display_options
    choice = gets.chomp.to_i

    case choice
    when 1 then app.list_books
    when 2 then app.list_people
    when 3 then app.create_person
    when 4 then app.create_book
    when 5 then app.create_rental
    when 6 then app.list_rentals
    when 7 then puts 'Thanks for using this app!'
                exit
    end
  end
end

main

# rubocop:enable Metrics/CyclomaticComplexity
