class BestBooks::Scraper
  def self.scrape_books
    html = open('https://thegreatestbooks.org/')
    doc = Nokogiri::HTML(html)
    NUMBER_OF_BOOKS.times do |book|
      # doc.css("h4 a") returns an array where even elements are titles and
      # odd elements are authors
      title = doc.css("h4 a")[book * 2].text.strip
      author = doc.css("h4 a")[book * 2 + 1].text.strip
      description = doc.css("p")[book].text.strip
      BestBooks::Book.new(title, author, description)
    end
  end

  #  returns the first paragraph from the wikipedia page for the book
  def self.wiki(book)
    search_string = book.title.split.join('+')
    google_search = open("https://www.google.com/search?q=wikipedia+#{search_string}")
    google_page = Nokogiri::HTML(google_search)
    google_url = google_page.css("cite")[0].text
    output_text = Nokogiri::HTML(open(google_url)).css('p')[1].text
    if output_text.strip != ""
      output_text
    else
      # This is a uniqe case needed for the Hamlet Wikipedia page, which
      # has slightly different formatting than the other pages.
      Nokogiri::HTML(open(google_url)).css('p')[2].text
    end
  end
end
