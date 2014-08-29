# -*- coding: utf-8 -*-
require "spec_helper"
require "support/aruba"
require "agate/cli"

RSpec.describe Agate::CLI do
  let(:text) { "勉【べん】強【きょう】します" }

  context "with defaults" do
    it "parses delimited text and echoes it back" do
      run_simple "agate #{text}"
      expect(all_output.chomp).to eql(text)
    end
  end

  context "with custom delimiters" do
    let(:text) { "勉(べん)強(きょう)します" }

    it "parses delimited text and echoes it back" do
      run_simple "agate --delimiters \"()\" #{text}"
      expect(all_output.chomp).to eql(text)
    end
  end

  context "with formatter" do
    let(:formatted_text) { "<ruby>勉<rp>【</rp><rt>べん</rt><rp>】</rp></ruby><ruby>強<rp>【</rp><rt>きょう</rt><rp>】</rp></ruby>します" }

    it "parses delimited text and echoes it back" do
      run_simple "agate --formatter html #{text}"
      expect(all_output.chomp).to eql(formatted_text)
    end
  end
end
