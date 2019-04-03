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
end
