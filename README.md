# Yaframework

[![Gem Version](https://badge.fury.io/rb/yaframework.svg)](https://badge.fury.io/rb/sinatra)
[![Build Status](https://app.travis-ci.com/maxbarsukov/yaframework.svg?token=T4CL2EqKG6FY816F3W3F&branch=master)](https://app.travis-ci.com/maxbarsukov/yaframework)

Yaframework is a [DSL](https://en.wikipedia.org/wiki/Domain-specific_language) for
quickly creating web applications in Ruby with minimal effort:

> _Wait, I've seen this somewhere..._

```ruby
# app.rb
require 'yaframework'
app = Yaframework::Application

app.get "/" do
  "Hello world!"
end

app.listen(4567)
```

Install the gem:

```shell
gem install yaframework
```

And run with:

```shell
ruby app.rb
```

View at [http://localhost:4567](http://localhost:4567)

The code you changed will not take effect until you restart the server.
Please restart the server every time you change.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yaframework'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install yaframework

## Usage

You can see usage examples in the [**examples**](https://github.com/maxbarsukov/yaframework/tree/master/examples) folder

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/yaframework. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/yaframework/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Yaframework project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/yaframework/blob/master/CODE_OF_CONDUCT.md).
