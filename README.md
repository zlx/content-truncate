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

By the way, It truncate a String to `limit_length`, as long as possible end with `<br/>` or `\n` or ` `  or ...

But In most cases, you only need call 

    String#content_truncate(limit_length)

directly, the default separators is `"<br/>", "\n", "。", ".", " "`

eg:

> The Model layer represents your domain model (such as Account, Product, Person, Post, etc.) and encapsulates the business logic that is specific to your application. In Rails, database-backed model classes are derived from ActiveRecord::Base. Active Record allows you to present the data from database rows as objects and embellish these data objects with business logic methods. Although most Rails models are backed by a database, models can also be ordinary Ruby classes, or Ruby classes that implement a set of interfaces as provided by the Active Model module. You can read more about Active Record in its README.

convert to

> The Model layer represents your domain model (such as Account, Product, Person, Post, etc.) and encapsulates the business logic that is specific to your application.

by call `String#content_truncate(180)`

*Note:In ruby < 1.9, the result for string contains unicode chars may be special, because the unicode char is process as two char*

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
