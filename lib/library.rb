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

 def publication_time_frame_for(author)
  publication_year_sorted = author.books.map do |book|
    book.publication_year.to_i
  end.sort
  start_end_publish = {start: publication_year_sorted.first.to_s,
  end: publication_year_sorted.last.to_s}
 end
end
