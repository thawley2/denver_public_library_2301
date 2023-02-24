class Author
attr_reader :books

  def initialize(author_data)
    @first_name = author_data[:first_name]
    @last_name = author_data[:last_name]
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(name_of_book, pub_date)
    @books << new_book = Book.new({
      author_first_name: @first_name, 
      author_last_name: @last_name,
      title: name_of_book,
      publication_date: pub_date
      })
    new_book
  end
end
