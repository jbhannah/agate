# -*- coding: utf-8 -*-
module Agate
  class Parser
    # Default options
    DEFAULTS = {
      :delimiters => "【】",
      :formatter  => :html
    }

    def initialize(options = {})
      @options = DEFAULTS.merge(options)

      @formatter = case @options[:formatter]
        when :html
          Agate::Formatter::HTML.new
        else
          Agate::Formatter::HTML.new
        end
    end

    # Parse `text` and return it with ruby character markup
    def parse(text)
      first = Regexp.escape(@options[:delimiters][0])
      last  = Regexp.escape(@options[:delimiters][-1])

      text.gsub(/(\p{Han}+)(#{first})([\p{Hiragana}\p{Katakana}]+)(#{last})/) { |match| @formatter.format($~) }
    end
  end
end
