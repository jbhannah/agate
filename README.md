# [Agate](http://en.wikipedia.org/w/index.php?title=Ruby_character&oldid=540994629#History)

[![Gem Version](https://badge.fury.io/rb/agate.png)](http://badge.fury.io/rb/agate)
[![Build Status](https://travis-ci.org/jbhannah/agate.png?branch=master)](https://travis-ci.org/jbhannah/agate)
[![Dependency Status](https://gemnasium.com/jbhannah/agate.png)](https://gemnasium.com/jbhannah/agate)
[![Code Climate](https://codeclimate.com/github/jbhannah/agate.png)](https://codeclimate.com/github/jbhannah/agate)
[![Coverage Status](https://coveralls.io/repos/jbhannah/agate/badge.png?branch=master)](https://coveralls.io/r/jbhannah/agate)

Wrap ruby characters (currently only furigana) in text with the
[HTML5 `ruby` element][]. **Requires Ruby 1.9 or later (or compabible
engine).**

## Usage

Install the gem with

    gem install agate

or add it to your `Gemfile`:

```ruby
gem "agate", "~> 0.3.2"
```

To markup a simple string with delimited furigana:

```ruby
require "rubygems"
require "agate"

options = {
  # can be any single character or pair of characters which surround ruby characters in text to parse
  :delimiters => "【】" # default delimiters
  # markup formatter to use (options: :html)
  :formatter => :html # default (and currently only) formatter
}

a = Agate::Parser.new(options) # call without arguments to use defaults
a.parse("勉【べん】強【きょう】します")
```

results in

```html
<ruby>勉<rp>【</rp><rt>べん</rt><rp>】</rp></ruby><ruby>強<rp>【</rp><rt>きょう</rt><rp>】</rp></ruby>します
```

which (in your browser) looks like

> <ruby>勉<rp>【</rp><rt>べん</rt><rp>】</rp></ruby><ruby>強<rp>【</rp><rt>きょう</rt><rp>】</rp></ruby>します

It's highly recommended to read the W3C's documentation on the [HTML5
`ruby` element][] to understand the usage of this element. There is a
[CSS workaround][] available that enables the display of ruby characters
in all modern browsers, but it's up to you to test all cases where you
intend to use the `ruby` element.

[HTML5 `ruby` element]: http://www.w3.org/TR/html5/text-level-semantics.html#the-ruby-element
[CSS workaround]: http://web.nickshanks.com/stylesheets/ruby.css
