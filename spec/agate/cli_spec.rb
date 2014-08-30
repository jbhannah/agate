# -*- coding: utf-8 -*-
require "spec_helper"
require "agate/cli"

RSpec.describe Agate::CLI do
  let(:cli)  { Agate::CLI.new }
  let(:text) { "勉【べん】強【きょう】します" }

  context "with defaults" do

    it "parses delimited text and echoes it back" do
      stub_const("Agate::CLI::ARGV", [text])
      expect(cli.parse).to eql(text)
    end
  end

  context "with custom delimiters" do
    let(:text) { "勉(べん)強(きょう)します" }

    it "parses delimited text and echoes it back" do
      stub_const("Agate::CLI::ARGV", ["-d", "\"()\"", text])
      expect(cli.parse).to eql(text)
    end
  end

  context "with formatter" do
    let(:formatted_text) { "<ruby>勉<rp>【</rp><rt>べん</rt><rp>】</rp></ruby><ruby>強<rp>【</rp><rt>きょう</rt><rp>】</rp></ruby>します" }

    it "parses delimited text and echoes it back" do
      stub_const("Agate::CLI::ARGV", ["-f", "html", text])
      expect(cli.parse).to eql(formatted_text)
    end
  end
end
