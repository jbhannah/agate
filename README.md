# [Agate](http://en.wikipedia.org/w/index.php?title=Ruby_character&oldid=540994629#History)

[![Gem Version](http://img.shields.io/gem/v/agate.svg?style=flat)](http://rubygems.org/gems/agate)
[![Build Status](http://img.shields.io/travis/jbhannah/agate.svg?style=flat)](https://travis-ci.org/jbhannah/agate)
[![Dependency Status](http://img.shields.io/gemnasium/jbhannah/agate.svg?style=flat)](https://gemnasium.com/jbhannah/agate)
[![Code Climate](http://img.shields.io/codeclimate/github/jbhannah/agate.svg?style=flat)](https://codeclimate.com/github/jbhannah/agate)
[![Coverage Status](http://img.shields.io/coveralls/jbhannah/agate.svg?style=flat)](https://coveralls.io/r/jbhannah/agate?branch=master)
[![Huboard](https://img.shields.io/github/issues/jbhannah/agate.svg?style=flat)](https://huboard.com/jbhannah/agate/)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/jbhannah/agate?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Format ruby characters (currently only furigana) in text for display. **Requires
Ruby 1.9 or later (or compatible engine).**

## Formatters

 * Plain text (echoes back passed text)
 * [HTML5 (`ruby` element)][h5]
 * Strip ruby text

## Usage

Install the gem with

    gem install agate

or add it to your `Gemfile`:

```ruby
gem "agate", "~> 0.6.0"
```

To markup a simple string with delimited furigana:

```ruby
require "rubygems"
require "agate"

options = {
  # can be any single character or pair of characters which surround ruby characters in text to parse
  :delimiters => "【】" # default delimiters
  # markup formatter to use (options: :plain (default), :html, :strip)
  :formatter => :html
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
`ruby` element][h5] to understand the usage of this element. There is a
[CSS workaround][css] available that enables the display of ruby characters
in all modern browsers, but it's up to you to test all cases where you
intend to use the `ruby` element.

[h5]: http://www.w3.org/TR/html5/text-level-semantics.html#the-ruby-element
[css]: http://web.nickshanks.com/stylesheets/ruby.css
