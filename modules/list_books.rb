module ListBooks
  def list_books
    puts 'List of Books:'
    @books.each do |book|
      puts "Title: #{book.title.capitalize}, Author: #{book.author.capitalize}"
    end
    puts "\n"
  end
end
