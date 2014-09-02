# -*- coding: utf-8 -*-
require "agate/formatter/html"
require "agate/formatter/plain"
require "agate/formatter/strip"

module Agate
  class Parser
    # Default options
    DEFAULTS = {
      :delimiters => "【】",
      :formatter  => :plain
    }

    def initialize(options = {})
      @options = DEFAULTS.merge(options)

      @formatter   = Agate.retrieve_formatter(@options[:formatter])
      @formatter ||= Agate::Formatter::Plain
    end

    # Parse `text` and return it with ruby character markup
    def parse(text)
      first = Regexp.escape(@options[:delimiters][0])
      last  = Regexp.escape(@options[:delimiters][-1])

      expr = /(\p{Han}+)(#{first})([\p{Hiragana}\p{Katakana}]+)(#{last})/u
      text.gsub(expr) { |match| @formatter.format($~) }
    end
  end
end
