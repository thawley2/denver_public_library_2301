require 'spec_helper'

RSpec.describe Library do
  before(:each) do
    @library = Library.new("Library of Alexandria")

    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @villette = @charlotte_bronte.write("Villette", "1853")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@library).to be_a(Library)
    end

    it 'has a name' do
      expect(@library.name).to eq("Library of Alexandria")
    end

    it 'starts with an empty array of books' do
      expect(@library.books).to eq([])
    end

    it 'starts with an empty array of authors' do
      expect(@library.authors).to eq([])
    end
  end

  describe '#add_author' do
    it 'can add authors to the library' do
      @library.add_author(@charlotte_bronte)

      expect(@library.authors).to eq([@charlotte_bronte])
    end

    it 'when adding authors to library it also adds the authors books to the library' do
      @library.add_author(@charlotte_bronte)

      expect(@library.books).to eq([@jane_eyre, @villette])
    end
  end

  describe '#sort_books_by_year' do
    it 'can sort books by year when given an author' do
      expect(@library.sort_books_by_year(@charlotte_bronte)).to eq([1847, 1853])

      universe = @charlotte_bronte.write("The Universe", "1854")

      expect(@library.sort_books_by_year(@charlotte_bronte)).to eq([1847, 1853, 1854])
    end
  end

  describe '#publication_time_frame_for' do
    it 'shows the publication year of first and last book the author has written' do
      @library.add_author(@charlotte_bronte)

      expect(@library.publication_time_frame_for(@charlotte_bronte)).to eq({start: "1847", end: "1853"})

      universe = @charlotte_bronte.write("The Universe", "1854")

      expect(@library.publication_time_frame_for(@charlotte_bronte)).to eq({start: "1847", end: "1854"})
    end
  end
end