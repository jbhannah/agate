# -*- coding: utf-8 -*-
module Agate
  class Parser
    @@defaults = {
    }

    def initialize(options = {})
      @options = @@defaults.merge(options)
    end

    def parse(text)
      text.gsub(/(\p{Han}+)(【)([\p{Hiragana}\p{Katakana}]+)(】)/, '<ruby>\1<rp>\2</rp><rt>\3</rt><rp>\4</rp></ruby>')
    end
  end
end
