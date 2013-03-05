# -*- coding: utf-8 -*-
require "spec_helper"

describe Agate::Parser do
  let!(:text) { "勉【べん】強【きょう】します" }
  let!(:agate) { Agate::Parser.new }
  let!(:parsed_text) { "<ruby>勉<rp>【</rp><rt>べん</rt><rp>】</rp></ruby><ruby>強<rp>【</rp><rt>きょう</rt><rp>】</rp></ruby>します" }

  it "parses demarcated text and turns it into HTML" do
    agate.parse(text).should eql(parsed_text)
  end
end
