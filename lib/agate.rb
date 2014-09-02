require "agate/version"

module Agate
  @@parsers = {}

  def self.register_formatter(sym, klass)
    @@parsers[sym] = klass
  end

  def self.retrieve_formatter(sym)
    @@parsers[sym]
  end
end

require "agate/parser"
