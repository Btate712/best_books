class BestBooks::Book
  attr_reader :title, :author, :description

  @@library = []

  def initialize(title, author, description = "")
    @title = title
    @author = author
    @description = description
    @@library << self
  end

  def self.library
    @@library
  end

  def self.populate_library
    BestBooks::Scraper.new.scrape_books
  end

  def wikipedia_summary
    summary = BestBooks::Scraper.wiki(self)
  end
end
