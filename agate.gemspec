# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'agate/version'

Gem::Specification.new do |spec|
  spec.name          = "agate"
  spec.version       = Agate::VERSION
  spec.authors       = ["Jesse B. Hannah"]
  spec.email         = ["jesse@jbhannah.net"]
  spec.description   = %q{Wrap ruby characters (e.g. furigana, Pinyin, Zhuyin) in text with the HTML ruby element.}
  spec.summary       = %q{Wrap ruby characters (e.g. furigana, Pinyin, Zhuyin) in text with the HTML ruby element.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
