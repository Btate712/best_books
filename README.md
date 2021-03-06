# BestBooks

This gem displays the top 10 books listed on thegreatestbooks.org and allows the
user to choose a book to view it's description.  The user is then asked if they
would like additional information on the book.  If the user answers yes, the
"wiki" function does a google search for "wikipedia" plus the book's title to
find the wikipedia page about the book and then scrapes the first paragraph from
the wikipedia page.  Paragraph output is formatted to a max width equal to the
constant PAGE_WIDTH.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'best_books'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install best_books

## Usage

Select a book by rank number to view its description.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'reactive-subroutine-8984'/best_books. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BestBooks project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'reactive-subroutine-8984'/best_books/blob/master/CODE_OF_CONDUCT.md).
