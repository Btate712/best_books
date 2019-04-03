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
    20.times do |book|
      self.new("Book Number #{book}", "Author Number #{book}")
    end
  end
end
