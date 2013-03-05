# -*- coding: utf-8 -*-
module Agate
  class Parser
    # Default options
    @@defaults = {
      :delimiters => "【】"
    }

    # Regexp reserved characters to escape when matching
    @@reserved = ["(", ")", "[", "]", "{", "}", ".", ",", "+", "*"]

    def initialize(options = {})
      @options = @@defaults.merge(options)
    end

    # Parse `text` and return it with ruby character markup
    def parse(text)
      first = @options[:delimiters].chars.first
      last  = @options[:delimiters].chars.last

      first = /#{'\\' + first}/ if @@reserved.include? first
      last  = /#{'\\' + last}/  if @@reserved.include? last

      text.gsub(/(\p{Han}+)(#{first})([\p{Hiragana}\p{Katakana}]+)(#{last})/,
        '<ruby>\1<rp>\2</rp><rt>\3</rt><rp>\4</rp></ruby>')
    end
  end
end
