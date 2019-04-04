class BestBooks::Scraper
  def initialize
    html = open('https://thegreatestbooks.org/')
    doc = Nokogiri::HTML(html)
    10.times do |book|
      title = doc.css("h4 a")[book * 2].text.strip
      author = doc.css("h4 a")[book * 2 + 1].text.strip
      description = doc.css("p")[book].text.strip
      BestBooks::Book.new(title, author, description)
    end
  end

  def self.google_scrape(search_string)
    google_search = open("https://www.google.com/search?q=wikipedia+#{search_string}")
    google_page = Nokogiri::HTML(google_search).css("cite")[0].text
    wikipedia_page = Nokogiri::HTML(open(google_page))
    doc = wikipedia_page
    doc.css('p')[1].text
  end
end
