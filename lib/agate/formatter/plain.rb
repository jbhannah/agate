# -*- coding: utf-8 -*-
require 'singleton'

module Agate
  module Formatter
    # Echoes back the text passed to it.
    #
    # > 勉【べん】強【きょう】します
    class Plain
      include Singleton

      # Turns a regexp match object into a formatted string with ruby characters
      def self.format(match)
        "#{match[1]}#{match[2]}#{match[3]}#{match[4]}"
      end
    end
  end
end

Agate.register_formatter(:plain, Agate::Formatter::Plain)
