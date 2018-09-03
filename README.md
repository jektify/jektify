# Jektify

[![Gem Version](https://badge.fury.io/rb/jektify.svg)](https://badge.fury.io/rb/jektify)
[![Build Status](https://travis-ci.org/jektify/jektify.svg?branch=master)](https://travis-ci.org/jektify/jektify)
[![security](https://hakiri.io/github/jektify/jektify/master.svg)](https://hakiri.io/github/jektify/jektify/master)

[Jektify](https://github.com/jektify/jektify) is beautiful and Customizable, much more appealing than a simple "iframe"!

[Jektify](https://github.com/jektify/jektify) is a jewel using to enter a theme for track entry, playlist, albums and artists of [Spotify](https://www.spotify.com), in [Jekyll](https://jekyllrb.com) templates.

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

It all starts with:

```shell
$ git clone https://github.com/jektify/jektify.git
$ cd jektify
```

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

*Code*

The [Jektify](https://github.com/jektify/jektify) code is stored in the folder "`lib`". Every time you change the version, it has to be changed in the file "`lib/jektify/version.rb`" respecting the version hierarchy. Files where the version should be changed:

* lib/jektify/version.rb
* bin/travis
* src/dev/page/Gemfile
* package.json
* gulpfile.babel.js
* cdn/v[VERSION]

*JavaScript*

[Jektify](https://github.com/jektify/jektify) uses javascript, where it is located in the folder "`src/dev/js/jektify.js`". All Javascript code must be written to it, regardless of whether it uses ES6 or not. Gem will use it in the folder "`assets/vendor/jektify/js`", and you need to minify it with [Gulp](https://gulpjs.com/) to play it there. To do this, run on the terminal in the root directory of Jektify:

```shell
$ gulp
```

The `cdn` folder should contain the original and mined jektify javascript file. It will have a folder structure with the name of each version of [Jektify](https://github.com/jektify/jektify). The service that makes CDN available is [RawGit](https://rawgit.com/).

*Sass*

The layout of [Jektify](https://github.com/jektify/jektify) is being attributed by the file "`assets/vendor/jektify/sass/_jektify.scss`", in this file you should write everything stylesheets [Jektify](https://github.com/jektify/jektify) using the methodology [BEM](getbem.com).

*Pack*

Now, you can generate the gem of Jektify with the `bundle exec rake build` command, it will be bundled in the directory "`pkg`". To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

*Webpage*

The development of the [Jektify](https://github.com/jektify/jektify) page is in the folder "`src/dev/page`", it is a Jekyll template. To develop, you need to update the [Jektify](https://github.com/jektify/jektify) version in the `Gemfile` file according to the version of the gem in development of [Jektify](https://github.com/jektify/jektify).

```yaml
group :jekyll_plugins do
  gem "jektify", "~> [VERSION_DEVELOPMENT]"
end
```

After that execute:

```shell
$ bundle install
$ ./serve
```

If Jektify adds new features and options, you should configure the file "` _config.yml`" in the Jektify block.

*Travis*

The [Jektify](https://github.com/jektify/jektify) uses [Travis](travis-ci.org) to do the gem tests, you should configure the Ruby version in `.travis.yml` (hidden) if necessary.

The "`bin/travis`" file will be the file that [Travis](travis-ci.org) will use to perform the script tests, in this file you must change the Jektify version in the variable "`APP__VERSION`" to the version that the Jekyll test project will use [Jektify](https://github.com/jektify/jektify).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jektify/jektify. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jektify project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jektify/jektify/blob/master/CODE_OF_CONDUCT.md).

## Credits

William C. Canin
