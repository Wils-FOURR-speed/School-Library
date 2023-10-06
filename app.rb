require_relative 'book'
require_relative 'person'
require_relative 'rental'

# Method to list all books
def list_all_books(books)
  puts 'List of all books:'
  books.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}"
  end
end

# Method to list all people
def list_all_people(people)
  puts 'List of all people:'
  people.each do |person|
    puts "ID: #{person.id}, Name: #{person.correct_name}, Age: #{person.age}"
  end
end

# Method to create a person (teacher or student)
def create_person(type, name, age, parent_permission)
  if type == 'teacher'
    person = Teacher.new(name, age, parent_permission: parent_permission)
    puts "Teacher created successfully. ID: #{person.id}"
  elsif type == 'student'
    person = Student.new(name, age, parent_permission: parent_permission)
    puts "Student created successfully. ID: #{person.id}"
  else
    puts "Invalid person type. Please choose 'teacher' or 'student'."
  end
end

# Method to create a book
def create_book(title, author)
  book = Book.new(title, author)
  puts "Book created successfully. Title: #{book.title}, Author: #{book.author}"
end

# Method to create a rental
def create_rental(date, book_id, person_id)
  book = books.find { |b| b.id == book_id }
  person = people.find { |p| p.id == person_id }

  if book.nil?
    puts "Book not found with ID: #{book_id}"
  elsif person.nil?
    puts "Person not found with ID: #{person_id}"
  else
    rental = Rental.new(date, book, person)
    puts "Rental created successfully. Date: #{rental.date}, Book: #{rental.book.title},
     Person: #{rental.person.correct_name}"
  end
end

# Method to list all rentals for a given person id
def list_rentals_for_person(person_id)
  person = people.find { |p| p.id == person_id }

  if person.nil?
    puts "Person not found with ID: #{person_id}"
  else
    puts "Rentals for Person ID #{person_id}:"
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}"
    end
  end
end

def create_person_prompt(people)
  puts 'Enter person type (teacher or student):'
  type = gets.chomp.downcase
  puts 'Enter person name:'
  name = gets.chomp
  puts 'Enter person age:'
  age = gets.chomp.to_i
  puts 'Does the person have parent permission? (true/false):'
  parent_permission = gets.chomp.downcase == 'true'
  create_person(name, type, age, parent_permission, people)
end

def create_book_prompt(books)
  puts 'Enter book title:'
  title = gets.chomp
  puts 'Enter book author:'
  author = gets.chomp
  create_book(title, author, books)
end

def create_rental_prompt(books, people, rentals)
  puts 'Enter rental date:'
  date = gets.chomp
  puts 'Enter book ID:'
  book_id = gets.chomp.to_i
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  create_rental(person_id, book_id, date, books, people, rentals)
end

def list_rentals_for_person_prompt(people, rentals)
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  list_rentals_for_person(person_id, rentals, people)
end

def exit_program
  puts 'Exiting the program...'
  exit
end

def main_loop(books, people, rentals)
  loop do
    display_menu
    choice = gets.chomp.to_i
    process_choice(choice, books, people, rentals)
  end
end

puts 'Thank you for using the Library App! Goodbye!'
