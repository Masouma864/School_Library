require_relative './nameable'
require_relative './capitalize'
require_relative './trimmer'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..200)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @correctable_name = name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def add_rentals(date, book_info)
    Rental.new(date, book_info, self)
  end
end
person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = Capitalize.new(person)
capitalized_person.correct_name
capitalized_trimmed = Trimmer.new(capitalized_person)
capitalized_trimmed.correct_name
