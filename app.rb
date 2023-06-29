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
    load_data
  end

  def save_books_data
    file_data = @books.map { |book| { 'title' => book.title, 'author' => book.author } }
    File.write('./data/books.json', JSON.generate(file_data))
  end

  def save_people_data
    file_data = @people.map { |person| { 'name' => person.name, 'id' => person.id, 'age' => person.age, 'classification' => person.class.name } }
    File.write('./data/people.json', JSON.generate(file_data))
  end

  def save_rentals_data
    file_data = @rentals.map do |rental|
      { 'date' => rental.date, 'book' => { 'title' => rental.book.title, 'author' => rental.book.author },
        'person' => { 'name' => rental.person.name, 'id' => rental.person.id, 'age' => rental.person.age } }
    end
    File.write('./data/rentals.json', JSON.generate(file_data))
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each do |person|
      if person.instance_of?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
  end


  def load_data
    load_books_data
    load_people_data
    load_rentals_data
  end

  def load_books_data
    file_data = File.read('./data/books.json')
    @books = if file_data
               JSON.parse(file_data).map do |book_data|
                 Book.new(book_data['title'], book_data['author'])
               end
             else
               []
             end
  end

  def load_people_data
    file_data = File.read('./data/people.json')
    return unless file_data && !file_data.empty?

    @people = JSON.parse(file_data).map do |person_data|
      if person_data['classification'] == 'Student'
        Student.new(nil, person_data['age'], person_data['name'])
      elsif person_data['classification'] == 'Teacher'
        Teacher.new(person_data['age'], person_data['name'], person_data['specialization'])
      else
        Person.new(person_data['age'], person_data['name'])
      end
    end
  end


  def load_rentals_data
    file_data = File.read('./data/rentals.json')
    @rentals = if file_data
                 JSON.parse(file_data).map do |rentals|
                   Rental.new(rentals['date'], Book.new(rentals['book']['title'], rentals['book']['author']),
                              Person.new(rentals['person']['age'], rentals['person']['name']))
                 end
               else
                 []
               end
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
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
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
    person_id = gets.chomp.to_i
    rented_books = @rentals.select { |rent| rent.person.id == person_id }
    rented_books.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title}, Author: #{rent.book.author}"
    end
  end

  def save
    save_books_data
    save_people_data
    save_rentals_data
    exit
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
