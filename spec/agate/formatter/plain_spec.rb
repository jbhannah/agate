# -*- coding: utf-8 -*-
require "spec_helper"
require "agate/formatter/plain"

RSpec.describe Agate::Formatter::Plain do
  let(:text) { "勉【べん】" }
  let(:expr) { /(\p{Han}+)(【)([\p{Hiragana}\p{Katakana}]+)(】)/u }

  it "echoes back the original string" do
    expect(text.gsub(expr) { |match| Agate::Formatter::Plain.format($~) }).to eql(text)
  end
end
