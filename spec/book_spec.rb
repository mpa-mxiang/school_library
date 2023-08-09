require_relative '../book'

RSpec.describe Book do
  let(:book) { Book.new('Title', 'Author') }

  describe '#initialize' do
    it 'sets the title and author correctly' do
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
    end
  end
end
