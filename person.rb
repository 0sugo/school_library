require_relative 'nameable'
require('./rental')
# define person class
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age = nil, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_book_rental(date,book)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  private
  def of_age?
    @age.to_i >= 18
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end
end

