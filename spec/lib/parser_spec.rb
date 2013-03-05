# -*- coding: utf-8 -*-
require "spec_helper"

describe Agate::Parser do
  context "with defaults" do
    let(:agate)       { Agate::Parser.new }
    let(:text)        { "勉【べん】強【きょう】します" }
    let(:parsed_text) { "<ruby>勉<rp>【</rp><rt>べん</rt><rp>】</rp></ruby><ruby>強<rp>【</rp><rt>きょう</rt><rp>】</rp></ruby>します" }

    it "parses delimited text and turns it into HTML" do
      agate.parse(text).should eql(parsed_text)
    end
  end

  context "with custom delimiters" do
    context "from regexp-reserved character list" do
      let(:agate) { Agate::Parser.new(:delimiters => "()") }
      let(:text)  { "勉(べん)強(きょう)します" }
      let(:parsed_text) { "<ruby>勉<rp>(</rp><rt>べん</rt><rp>)</rp></ruby><ruby>強<rp>(</rp><rt>きょう</rt><rp>)</rp></ruby>します" }

      it "parses delimited text and turns it into HTML" do
        agate.parse(text).should eql(parsed_text)
      end
    end

    context "arbitrary" do
      let(:agate) { Agate::Parser.new(:delimiters => "@") }
      let(:text)  { "勉@べん@強@きょう@します" }
      let(:parsed_text) { "<ruby>勉<rp>@</rp><rt>べん</rt><rp>@</rp></ruby><ruby>強<rp>@</rp><rt>きょう</rt><rp>@</rp></ruby>します" }

      it "parses delimited text and turns it into HTML" do
        agate.parse(text).should eql(parsed_text)
      end
    end
  end
end
