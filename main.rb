require_relative 'app'

puts 'Welcome to the App!'

class Main
    def display_menu
        puts 'Please select an option:'
        puts '1. List all books'
        puts '2. List all people'
        puts '3. Create a person'
        puts '4. Create a book'
        puts '5. Create a rental'
        puts '6. List rentals for a person'
        puts '0. Exit'
      end
      
      def process_choice(choice, books, people, rentals)
        choice_actions = {
          1 => -> { list_all_books(books) },
          2 => -> { list_all_people(people) },
          3 => -> { create_person_prompt(people) },
          4 => -> { create_book_prompt(books) },
          5 => -> { create_rental_prompt(books, people, rentals) },
          6 => -> { list_rentals_for_person_prompt(people, rentals) },
          0 => -> { exit_program }
        }
      
        action = choice_actions[choice]
        action&.call || puts('Invalid choice. Please try again.')
      end

      
#   app = App.new
#   app.start
end

Main.new
