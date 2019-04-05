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
    BestBooks::Scraper.new
  end

  def show_wikipedia_summary
    summary = BestBooks::Scraper.wiki(self)
    BestBooks::Formatter.display(summary, PAGE_WIDTH)
  end
end
