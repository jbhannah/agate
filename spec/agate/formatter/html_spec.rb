# -*- coding: utf-8 -*-
require "spec_helper"
require "agate/formatter/html"

RSpec.describe Agate::Formatter::HTML do
  let(:text)           { "勉【べん】" }
  let(:formatted_text) { "<ruby>勉<rp>【</rp><rt>べん</rt><rp>】</rp></ruby>" }
  let(:expr)           { /(\p{Han}+)(【)([\p{Hiragana}\p{Katakana}]+)(】)/u }

  it "returns the string formatted as HTML5 ruby" do
    expect(text.gsub(expr) { |match| Agate::Formatter::HTML.format($~) }).to eql(formatted_text)
  end
end
