# -*- coding: utf-8 -*-
require 'agate'
require 'singleton'
require 'optparse'

module Agate
  class CLI
    # include Singleton

    def initialize
      @options = {}
    end

    def parse
      parse_opts

      agate = Agate::Parser.new(@options)
      agate.parse(ARGV.join)
    end

  private
    def parse_opts
      opts = OptionParser.new do |o|
        o.banner = "Usage: agate [options] text-to-convert"

        o.separator ""
        o.separator "Options:"

        o.on("-d", "--delimiters DELIMITERS", "Specify custom delimiters for ruby text (default: 【】)") do |delims|
          @options[:delimiters] = delims
        end

        o.on("-f", "--formatter FORMAT", "Specify a formatter to use (default/fallback: HTML)") do |format|
          @options[:formatter] = format.to_sym
        end

        o.on_tail("-h", "--help", "Show this message") do
          puts o
          exit
        end

        o.on_tail("-v", "--version", "Show version") do
          puts Agate::VERSION
          exit
        end
      end

      opts.parse!(ARGV)
    end
  end
end
