# -*- coding: utf-8 -*-
require "spec_helper"

RSpec.describe Agate::Parser do
  context "with defaults" do
    let(:agate)       { Agate::Parser.new }
    let(:text)        { "勉【べん】強【きょう】します" }

    it "parses delimited text and echoes it back" do
      expect(agate.parse(text)).to eql(text)
    end
  end

  context "with custom delimiters" do
    context "from regexp-reserved character list" do
      let(:agate) { Agate::Parser.new(:delimiters => "()") }
      let(:text)  { "勉(べん)強(きょう)します" }

      it "parses delimited text and echoes it back" do
        expect(agate.parse(text)).to eql(text)
      end
    end

    context "arbitrary" do
      let(:agate) { Agate::Parser.new(:delimiters => "@") }
      let(:text)  { "勉@べん@強@きょう@します" }

      it "parses delimited text and echoes it back" do
        expect(agate.parse(text)).to eql(text)
      end
    end
  end

  context "with formatter" do
    context "HTML" do
      let(:agate)       { Agate::Parser.new(:formatter => :html) }
      let(:text)        { "勉【べん】強【きょう】します" }
      let(:parsed_text) { "<ruby>勉<rp>【</rp><rt>べん</rt><rp>】</rp></ruby><ruby>強<rp>【</rp><rt>きょう</rt><rp>】</rp></ruby>します" }

      it "parses delimited text and formats it with the specified formatter" do
        expect(agate.parse(text)).to eql(parsed_text)
      end
    end

    context "not matching an available formatter" do
      let(:agate)       { Agate::Parser.new(:formatter => :foobar) }
      let(:text)        { "勉【べん】強【きょう】します" }

      it "parses delimited text and echoes it back" do
        expect(agate.parse(text)).to eql(text)
      end
    end
  end
end
