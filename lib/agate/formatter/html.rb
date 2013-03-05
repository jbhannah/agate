module Agate
  module Formatter
    # Formats text using HTML5 ruby tags, turning
    #
    # > 勉【べん】強【きょう】します
    #
    # into
    #
    #     <ruby>勉<rp>【</rp><rt>べん</rt><rp>】</rp></ruby><ruby>強<rp>【</rp><rt>きょう</rt><rp>】</rp></ruby>します
    #
    # which can then be rendered by some web browsers or formatted
    # using CSS.
    class HTML
      # Turns a regexp match object into a formatted string with ruby characters
      def format(match)
        "<ruby>#{match[1]}<rp>#{match[2]}</rp><rt>#{match[3]}</rt><rp>#{match[4]}</rp></ruby>"
      end
    end
  end
end