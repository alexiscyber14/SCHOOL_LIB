require 'json'

module CreateBook
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    # Save books to a JSON file
    if File.exist?('./data/books.json')
      json_data = File.read('./data/books.json')
      existing_books = JSON.parse(json_data)
    else
      existing_books = []
    end
    data = existing_books + @books.map { |book| { title: book.title, author: book.author } }
    File.write('./data/books.json', JSON.generate(data))
    puts 'Book created successfully.'
    puts "\n"
  end
end
