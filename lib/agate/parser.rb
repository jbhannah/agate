# -*- coding: utf-8 -*-
module Agate
  class Parser
    def initialize(text)
      @text = text
    end

    def text
      @text
    end

    def parse
      @parsed_text ||= @text.gsub(/(\p{Han}+)(【)([\p{Hiragana}\p{Katakana}]+)(】)/, '<ruby>\1<rp>\2</rp><rt>\3</rt><rp>\4</rp></ruby>')
    end
  end
end
