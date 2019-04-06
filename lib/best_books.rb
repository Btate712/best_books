require_relative "./best_books/version"
require_relative "./best_books/CLI"
require_relative "./best_books/book"
require_relative "./best_books/scraper"

require 'nokogiri'
require 'open-uri'
require 'pry'

NUMBER_OF_BOOKS = 15
PAGE_WIDTH = 100
