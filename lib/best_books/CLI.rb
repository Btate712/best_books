# CLI Controller
class BestBooks::CLI
  def call
    puts "100 Best Books according to https://thegreatestbooks.org/..."

    BestBooks::Book.populate_library
    display_books

  end

  def display_books
    20.times do |book|
      puts "#{book + 1}: #{BestBooks::Book.library[book].title}, by #{BestBooks::Book.library[book].author}"
    end
  end

end
