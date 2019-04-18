# CLI Controller
class BestBooks::CLI
  attr_accessor :current_book

  def call
    finished = false
    BestBooks::Book.populate_library

    clear_screen
    welcome_message

    until finished
      display_books
      get_user_choice
      display_description
      offer_more_info
      finished = finished?
    end
    goodbye
  end

  def clear_screen
    system("clear")
    system("cls")
  end

  def welcome_message
    puts "#{NUMBER_OF_BOOKS} Best Books according to https://thegreatestbooks.org/..."
  end

  def display_books
    puts "\n"
    BestBooks::Book.library.each.with_index(1) { |book, i| puts "#{i}: #{book.title}, by #{book.author}:" }
    puts "\n"
  end

  def display_description
    clear_screen
    puts "\n#{current_book.title}, by #{current_book.author}"
    display(current_book.description, PAGE_WIDTH)
  end

  def get_user_choice
    isValid = false
    while !isValid
      puts "Which book would you like more information on?"
      choice = gets.strip.to_i
      if choice.between?(1, NUMBER_OF_BOOKS)
        isValid = true
      else
        puts "Invalid selection..."
      end
    end
    self.current_book = BestBooks::Book.library[choice - 1]
  end

  def finished?
    puts "Would you like to look at other books? (y/n)"
    response = gets.strip.downcase
    clear_screen
    response == "y" ? false : true
  end

  def offer_more_info
    puts "Want more info? (y/n)"
    input = gets.strip.downcase
    if input == "y"
      display(current_book.wikipedia_summary, PAGE_WIDTH)
    end
  end

  def goodbye
    puts "Thank you for using BestBooks!"
  end

  def display(text, width)    # limits the line length to a number of characters
    puts "\n"
    line_space_left = width   # equal to the variable width
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
