# -*- coding: utf-8 -*-
module Agate
  module Formatter
    # Echoes back the text passed to it.
    #
    # > 勉【べん】強【きょう】します
    class Plain
      # Turns a regexp match object into a formatted string with ruby characters
      def format(match)
        "#{match[1]}#{match[2]}#{match[3]}#{match[4]}"
      end
    end
  end
end
