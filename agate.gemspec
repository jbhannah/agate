# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'agate/version'

Gem::Specification.new do |spec|
  spec.name          = "agate"
  spec.version       = Agate::VERSION
  spec.authors       = ["Jesse B. Hannah"]
  spec.email         = ["jesse@jbhannah.net"]
  spec.description   = %q{Format ruby characters (currently only furigana) in text for display.}
  spec.summary       = %q{Format ruby characters (currently only furigana) in text for display.}
  spec.homepage      = "https://github.com/jbhannah/agate"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "coveralls"
end
