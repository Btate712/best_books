# CLI Controller
class BestBooks::CLI
  def call
    finished = false
    BestBooks::Book.populate_library

    puts "100 Best Books according to https://thegreatestbooks.org/..."

    until finished
      display_books
      book_choice = get_user_choice
      display_description(book_choice)
      offer_more_info(book_choice)
      finished = finished?
    end
    goodbye
  end

  def display_books
    NUMBER_OF_BOOKS.times do |book|
      book_title = BestBooks::Book.library[book].title
      book_author = BestBooks::Book.library[book].author
      puts "#{book + 1}: #{book_title}, by #{book_author}"
    end
  end

  def display_description(book_choice)
    book_title = BestBooks::Book.library[book_choice].title
    book_author = BestBooks::Book.library[book_choice].author
    summary = BestBooks::Book.library[book_choice].description

    puts "#{book_title}, by #{book_author}"
    BestBooks::Formatter.display(summary, PAGE_WIDTH)
  end

  def get_user_choice
    puts "Which book would you like more information on?"
    gets.strip.to_i - 1
  end

  def finished?
    puts "Would you like to look at other books? (y/n)"
    response = gets.strip.downcase
    response == "y" ? false : true
  end

  def offer_more_info(book_choice)
    puts "Want more info? (y/n)"
    input = gets.strip.downcase
    if input == "y"
      BestBooks::Book.library[book_choice].show_wikipedia_summary
    end
  end

  def goodbye
    puts "Thank you for your patronage!"
  end
end
