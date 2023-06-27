# frozen_string_literal: true

require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'manage_people'
require 'json'
# define class app
class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def save_books_data(all_books)
    File.write('./data/books.json', all_books.join("\n"), mode: 'a')
  end

  def save_people_data(all_people)
    File.write('./data/people.json', all_people.join("\n"), mode: 'a')
  end

  def save_rentals_data(all_rentals)
    File.write('./data/rentals.json', all_rentals.join("\n"), mode: 'a')
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    print 'Do you want to create a new student (1) or teacher (2)? [Input the number]: '
    selected_person_type = Integer(gets.chomp)
    case selected_person_type
    when 1
      create_student
    when 2
      create_teacher
    end
    save_people_data(@people)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    save_books_data(@books)
  end

  def create_rental
    return puts 'No books created. Please create a book.' if @books.empty?
    return puts 'No people created. Please create a person.' if @people.empty?

    selected_book = select_book
    selected_person = select_person
    selected_date = rental_date

    rented = Rental.new(selected_date, @books[selected_book], @people[selected_person])
    @rentals << rented
    puts 'Book was successfully rented.'
    save_rentals_data(@rentals)
  end

  def select_book
    puts 'Select a book from the following list by entering the number:'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    Integer(gets.chomp)
  end

  def select_person
    puts 'Select a person from the following list by entering the number (not ID):'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
    end
    Integer(gets.chomp)
  end

  def rental_date
    puts 'Enter the rental date in MM/DD/YYYY format:'
    gets.chomp.to_s
  end

  def list_rental
    print 'Enter the Person ID: '
    person_id = Integer(gets.chomp)
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title} Author: #{rent.book.author}" if rent.person.id == person_id
    end
  end

  def invalid_option
    puts 'Invalid option'
  end

  def options
    puts 'Please enter the number for the task you want to perform'
    puts 'choose one of the following'
    puts '1 - List all books.'
    puts '2 - List all people.'
    puts '3 - Create a person (teacher or student).'
    puts '4 - Create a book.'
    puts '5 - Create a rental.'
    puts '6 - List all rentals for a given person id.'
    puts '7 - Exit'
  end
end
