# -*- coding: utf-8 -*-
require 'agate'
require 'singleton'
require 'optparse'

module Agate
  class CLI
    include Singleton

    def initialize
      @options = {}
    end

    def start
      parse_opts

      agate = Agate::Parser.new(@options)
      puts agate.parse(ARGV.join)
    end

  private
    def parse_opts
      opts = OptionParser.new do |opts|
        opts.banner = "Usage: agate [options] text-to-convert"

        opts.separator ""
        opts.separator "Options:"

        opts.on("-d", "--delimiters DELIMITERS", "Specify custom delimiters for ruby text (default: 【】)") do |delims|
          @options[:delimiters] = delims
        end

        opts.on("-f", "--formatter FORMAT", "Specify a formatter to use (default/fallback: HTML)") do |format|
          @options[:formatter] = format.to_sym
        end

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        opts.on_tail("-v", "--version", "Show version") do
          puts Agate::VERSION
          exit
        end
      end

      opts.parse!(ARGV)
    end
  end
end
