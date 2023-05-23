require_relative './app'
require_relative './menu'

def main
  app = App.new
  app.load_books('books.json')
  app.load_people('people.json')
  app.load_rentals('rentals.json')

  menu = Menu.new app

  puts '
  Welcome to School Library App!'

  loop do
    menu.display_options
    choice = gets.chomp.to_i
    abort('Thanks for using this app!') if choice == menu.menu_exit
    menu.choose choice
  end
end

main
