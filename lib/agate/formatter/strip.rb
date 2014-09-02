# -*- coding: utf-8 -*-
require 'singleton'

module Agate
  module Formatter
    # Strips ruby text from a string.
    #
    # > 勉強します
    class Strip
      include Singleton

      # Turns a regexp match object into a formatted string with ruby characters
      def self.format(match)
        "#{match[1]}"
      end
    end
  end
end
