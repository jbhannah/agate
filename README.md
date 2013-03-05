# [Agate](http://en.wikipedia.org/w/index.php?title=Ruby_character&oldid=540994629#History)

[![Build Status](https://travis-ci.org/jbhannah/agate.png?branch=master)](https://travis-ci.org/jbhannah/agate)
[![Dependency Status](https://gemnasium.com/jbhannah/agate.png)](https://gemnasium.com/jbhannah/agate)
[![Code Climate](https://codeclimate.com/github/jbhannah/agate.png)](https://codeclimate.com/github/jbhannah/agate)
[![Coverage Status](https://coveralls.io/repos/jbhannah/agate/badge.png?branch=master)](https://coveralls.io/r/jbhannah/agate)

Wrap ruby characters (e.g. furigana, Pinyin, Zhuyin) in text with the
[HTML `ruby` element][].

## Usage

```ruby
a = Agate::Parser.new("勉【べん】強【きょう】します")
a.parse
```

results in

```html
<ruby>勉<rt>べん</rt></ruby><ruby>強<rt>きょう</rt></ruby>します
```

It's highly recommended to read the W3C's documentation on the [HTML
`ruby` element][] to understand the usage of this element. There is a
[CSS workaround][] available that enables the display of ruby characters
in all modern browsers, but it's up to you to test all cases where you
intend to use the `ruby` element.

[HTML `ruby` element]: http://www.w3.org/TR/html5/text-level-semantics.html#the-ruby-element
[CSS workaround]: http://web.nickshanks.com/stylesheets/ruby.css
