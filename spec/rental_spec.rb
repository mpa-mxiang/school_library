require_relative '../rental'
require_relative '../person'
require_relative '../book'

RSpec.describe Rental do
  let(:person) { Person.new(25, name: 'John Doe') }
  let(:book) { Book.new('Title', 'Author') }
  let(:rental_date) { '2023-07-20' }
  let(:rental) { Rental.new(rental_date, book, person) }

  describe '#initialize' do
    it 'creates a new rental with the given date, book, and person' do
      expect(rental.date).to eq('2023-07-20')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book and person' do
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
