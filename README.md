# Agate

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
=> <ruby>勉<rt>べん</rt></ruby><ruby>強<rt>きょう</rt></ruby>します
```

[HTML `ruby` element]: http://www.w3.org/TR/html5/text-level-semantics.html#the-ruby-element
