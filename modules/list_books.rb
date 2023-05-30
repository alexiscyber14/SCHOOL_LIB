require 'json'

module ListBooks
  def list_books
    puts 'List of Books:'

    if File.exist?('./data/books.json')
      file = File.read('./data/books.json')
      books = JSON.parse(file)

      books.each do |book_data|
        title = book_data['title']
        author = book_data['author']
        puts "Title: #{title}, Author: #{author}"
      end
    else
      puts 'Error: File does not exist.'
      print 'Enter "1" to exit the program: '
      input = gets.chomp
      exit if input == '1'
    end

    puts "\n"
  end
end
