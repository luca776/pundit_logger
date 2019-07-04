# PunditLogger

`pundit_logger` adds logging during key [Pundit](https://github.com/varvet/pundit) events to your application logs.

Use `pundit_logger` in production environments, most likely to log details about 401 Unauthorized occurances in your application.

`pundit_logger` can also speed with development and debugging with identification of the policies and scopes involved in controller requests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pundit_logger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pundit_logger

## Usage

By including `pundit_logger` in a Rails application's `Gemfile`, logging will happen automatically. Just watch your logs for lines tagged with `[PUNDIT]` (assuming your log level is at least `debug` - you change that in gem configuration)

## Configuration

To configure `pundit_logger`, add a Rails initializer. You can generate a default initalizer:

    $ rails generate pundit_logger:install

Configuration options are documented in that generated file, or [lib/pundit_logger/configuration.rb](lib/pundit_logger/configuration.rb). See specs for examples.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pundit_logger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PunditLogger project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pundit_logger/blob/master/CODE_OF_CONDUCT.md).
