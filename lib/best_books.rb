require_relative "./best_books/version"
require_relative "./best_books/CLI"
require_relative "./best_books/book"
require_relative "./best_books/scraper"
require_relative "./best_books/formatter"
require 'nokogiri'
require 'open-uri'
require 'pry'

NUMBER_OF_BOOKS = 10
PAGE_WIDTH = 100
