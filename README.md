# ContentTruncate

[![build status](https://secure.travis-ci.org/zlx/content-truncate.png)](https://travis-ci.org/zlx/content-truncate)

smart truncate for content

## Installation

Add this line to your application's Gemfile:

    gem 'content_truncate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install content_truncate

## Usage

    String#content_truncate(limit_length, "<br/>", "\n", " ", ...)

In the example, It truncate a String to `limit_length`, as long as possible end with `<br/>` or `\n` or ` `  or ...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
