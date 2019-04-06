# CLI Controller
class BestBooks::CLI
  def call
    finished = false
    BestBooks::Book.populate_library

    welcome_message

    until finished
      display_books
      book_choice = get_user_choice
      display_description(book_choice)
      offer_more_info(book_choice)
      finished = finished?
    end
    goodbye
  end

  def welcome_message
    puts "#{NUMBER_OF_BOOKS} Best Books according to https://thegreatestbooks.org/..."
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
    display(summary, PAGE_WIDTH)
  end

  def get_user_choice
    isValid = false
    while !isValid
      puts "Which book would you like more information on?"
      choice = gets.strip.to_i
      if choice >= 1 && choice <= NUMBER_OF_BOOKS
        isValid = true
      else
        puts "Invalid selection..."
      end
    end
    choice
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
      display(BestBooks::Book.library[book_choice].wikipedia_summary, PAGE_WIDTH)
    end
  end

  def goodbye
    puts "Thank you for using best_books!"
  end

  def display(text, width)
    line_space_left = width
    text.split.each do |word|
      if word.length > line_space_left
        print "\n"
        line_space_left = width
      end
      print word + " "
      line_space_left -= (word.length + 1)
    end
    puts "\n\n"
  end
end
