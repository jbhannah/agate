# -*- coding: utf-8 -*-
require "spec_helper"
require "agate/formatter/strip"

RSpec.describe Agate::Formatter::Strip do
  let(:text)           { "勉【べん】" }
  let(:formatted_text) { "勉" }
  let(:expr)           { /(\p{Han}+)(【)([\p{Hiragana}\p{Katakana}]+)(】)/u }

  it "returns the string with ruby text stripped" do
    expect(text.gsub(expr) { |match| Agate::Formatter::Strip.format($~) }).to eql(formatted_text)
  end
end
