# -*- coding: utf-8 -*-
module Agate
  class Parser
    # Default options
    DEFAULTS = {
      :delimiters => "【】",
      :formatter  => :plain
    }

    def initialize(options = {})
      @options = DEFAULTS.merge(options)

      @formatter = case @options[:formatter]
        when :html
          Agate::Formatter::HTML.new
        when :plain
          Agate::Formatter::Plain.new
        else
          Agate::Formatter::Plain.new
        end
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
