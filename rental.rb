class Rental
  attr_accessor :date, :book, :customer

  def initialize(date, book,_customer)
    @date = date

    @book = book
    book.rentals << self unless book.rentals.include?(self)
    @person = person
    person.rentals << self unless person.rentals.include?(self)
    @date = date
  end
end
