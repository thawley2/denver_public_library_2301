require 'spec_helper'

RSpec.describe Book do
  before(:each) do
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
    @book2 = Book.new({author_first_name: "Thomas", author_last_name: "Hawley", title: "The universe", publication_date: "2023"})
    
  end

  describe '#initialize' do
    it 'exists' do
      expect(@book).to be_a(Book)
    end

    it 'has a title' do
      expect(@book.title).to eq("To Kill a Mockingbird")
    end

    it 'has an author' do
      expect(@book.author).to eq("Harper Lee")
    end

    it 'has a publication year' do
      expect(@book.publication_year).to eq("1960")
    end

    it 'can still show publication year if only a year is provided' do
      expect(@book2.publication_year).to eq("2023")
    end
  end
end