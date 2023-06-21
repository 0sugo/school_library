require_relative './nameable'
# Define class person
class Person < Nameable
  def initialize(name = 'unknown', age = nil, parent_permission: true)
    super
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def of_age?
    @age.to_i >= 18
  end

  def can_use_services?
    return true if of_age || @parent_permission

    false
  end

  def correct_name
    @name
  end
end
