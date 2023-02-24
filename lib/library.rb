class Library
 attr_reader :name, :books, :authors

 def initialize(name)
  @name = name
  @books = []
  @authors = []
 end

 def add_author(author)
  @authors << author
  author.books.each {|book| @books << book}
 end

 def sort_books_by_year(author)
  author.books.map do |book|
    book.publication_year.to_i
  end.sort
 end

 def publication_time_frame_for(author)
  {start: sort_books_by_year(author).first.to_s,
  end: sort_books_by_year(author).last.to_s}
 end
end
