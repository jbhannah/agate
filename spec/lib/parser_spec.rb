# -*- coding: utf-8 -*-
require "spec_helper"

describe Agate::Parser do
  let!(:text) { "勉【べん】強【きょう】します" }
  let!(:agate) { Agate::Parser.new(text) }
  let!(:parsed_text) { "<ruby>勉<rt>べん</rt></ruby><ruby>強<rt>きょう</rt></ruby>します" }

  it "saves text to an instance variable" do
    agate.text.should eql(text)
  end

  it "parses demarcated text and turns it into HTML" do
    agate.parse.should eql(parsed_text)
  end
end
