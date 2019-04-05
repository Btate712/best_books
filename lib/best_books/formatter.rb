class BestBooks::Formatter
  def initialize(text)
    @text = text
  end

  def display(width)
    text_array = @text.split
    line_space_left = width
    text_array.each do |word|
      if word.length < line_space_left
        print word + " "
      else
        print "\n"
        line_space_left = width
        print word + " "
      end
      line_space_left -= (word.length + 1)
    end
    puts "\n\n"
  end
end