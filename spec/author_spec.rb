require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Author do
  before(:each) do
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    # @jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@charlotte_bronte).to be_a(Author)
    end

    it 'has a name' do
      expect(@charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'has an empty array of books' do
      expect(@charlotte_bronte.books).to eq([])
    end
  end

  describe '#write' do
    it 'can write a book' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      
      expect(jane_eyre.class).to eq(Book)
    end

    it 'has a title' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(jane_eyre.title).to eq("Jane Eyre")
    end
  end

  describe '#books' do
    it 'can list all books writen by author' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = @charlotte_bronte.write("Villette", "1853")

      expect(@charlotte_bronte.books).to eq([jane_eyre, villette])
    end
  end
end