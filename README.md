# Jektify

[![Gem Version](https://badge.fury.io/rb/jektify.svg)](https://badge.fury.io/rb/jektify)
[![Build Status](https://travis-ci.org/jektify/jektify.svg?branch=master)](https://travis-ci.org/jektify/jektify)
[![Dependency Status](https://beta.gemnasium.com/badges/github.com/jektify/jektify.svg)](https://beta.gemnasium.com/projects/github.com/jektify/jektify)
[![security](https://hakiri.io/github/jektify/jektify/master.svg)](https://hakiri.io/github/jektify/jektify/master)


[Jektify](https://github.com/jektify/jektify) is beautiful and Customizable, much more appealing than a simple "iframe"!

[Jekyll](https://jekyllrb.com) is a jewel using to enter a theme for track entry, playlist, albums and artists of [Spotify](https://www.spotify.com), in Jekyll templates.

Besides inserting music is fully responsive, adjusting as your page layout, even on mobile devices.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jektify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jektify

## Usage

To use, you need [Jekyll](https://jekyllrb.com) installed, since [Jektify](https://github.com/jektify/jektify) is a gem for the same. You can have more information about Jektify on our [homepage](https://jektify.github.io), where you'll be detailing step by step how to use Jektyll together.

## Documentation

See: [https://jektify.github.io](https://jektify.github.io)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

*JavaScript*

[Jektify](https://github.com/jektify/jektify) uses javascript, where it is located in the folder "`src/js/jektify.js`". All Javascript code must be written to it, regardless of whether it uses ES6 or not. Gem will use it in the folder "`assets/js`", and you need to minify it with [Gulp](https://gulpjs.com/) to play it there. To do this, run on the terminal in the root directory of Jektify:

```shell
gulp
```

*Sass*


To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jektify/jektify. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jektify project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jektify/jektify/blob/master/CODE_OF_CONDUCT.md).

## Credits

William C. Canin
