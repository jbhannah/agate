# -*- coding: utf-8 -*-
module Agate
  class Parser
    # Default options
    DEFAULTS = {
      :delimiters => "【】",
      :formatter  => :html
    }

    # Regexp reserved characters to escape when matching
    RESERVED = ["(", ")", "[", "]", "{", "}", ".", ",", "+", "*"]

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
      first = @options[:delimiters][0]
      last  = @options[:delimiters][-1]

      first = /#{'\\' + first}/ if RESERVED.include? first
      last  = /#{'\\' + last}/  if RESERVED.include? last

      text.gsub(/(\p{Han}+)(#{first})([\p{Hiragana}\p{Katakana}]+)(#{last})/) { |match| @formatter.format($~) }
    end
  end
end
