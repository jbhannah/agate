# -*- coding: utf-8 -*-
require "spec_helper"

describe Agate::Parser do
  let!(:text) { "勉強【べんきょう】します" }
  let!(:agate) { Agate::Parser.new(text) }
  let!(:parsed_text) { "<ruby>勉強<rt>べんきょう</rt></ruby>します" }

  it "saves text to an instance variable" do
    agate.text.should eql(text)
  end

  it "parses demarcated text and turns it into HTML" do
    agate.parse.should eql(parsed_text)
  end
end
