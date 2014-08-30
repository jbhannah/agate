# -*- coding: utf-8 -*-
require "spec_helper"
require "agate/cli"

RSpec.describe Agate::CLI do
  let(:cli)  { File.join(File.expand_path(File.dirname(__FILE__)), "..", "..", "bin", "agate") }
  let(:text) { "勉【べん】強【きょう】します" }

  context "with help option" do
    it "shows the help message and exits" do
      stub_const("Agate::CLI::ARGV", ["-h"])
      text = <<-eos
Usage: agate [options] text-to-convert

Options:
    -d, --delimiters DELIMITERS      Specify custom delimiters for ruby text (default: 【】)
    -f, --formatter FORMAT           Specify a formatter to use (default/fallback: plain text)
    -h, --help                       Show this message
    -v, --version                    Show version
eos
      # expect { load cli }.to raise_error SystemExit
      expect do
        begin
          load cli
        rescue SystemExit
        end
      end.to output(text).to_stdout
    end
  end

  context "with defaults" do
    it "parses delimited text and echoes it back" do
      stub_const("Agate::CLI::ARGV", [text])
      expect { load cli }.to output(text + "\n").to_stdout
    end
  end

  context "with custom delimiters" do
    let(:text) { "勉(べん)強(きょう)します" }

    it "parses delimited text and echoes it back" do
      stub_const("Agate::CLI::ARGV", ["-d", "\"()\"", text])
      expect { load cli }.to output(text + "\n").to_stdout
    end
  end

  context "with formatter" do
    let(:formatted_text) { "<ruby>勉<rp>【</rp><rt>べん</rt><rp>】</rp></ruby><ruby>強<rp>【</rp><rt>きょう</rt><rp>】</rp></ruby>します" }

    it "parses delimited text and echoes it back" do
      stub_const("Agate::CLI::ARGV", ["-f", "html", text])
      expect { load cli }.to output(formatted_text + "\n").to_stdout
    end
  end
end
