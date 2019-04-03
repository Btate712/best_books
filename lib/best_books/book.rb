class BestBooks::Book
  attr_accessor :title, :author, :description

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
end
