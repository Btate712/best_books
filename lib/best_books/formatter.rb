class BestBooks::Formatter
  # displays @text in paragraph format with a max width equal to the variable width
  def self.display(text, width)
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
