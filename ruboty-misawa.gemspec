# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/misawa/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-misawa"
  spec.version       = Ruboty::Misawa::VERSION
  spec.authors       = ["mzp"]
  spec.email         = ["mzpppp@gmail.com"]
  spec.summary       = %q{Ruboty plugin to show horesase-boys.}
  spec.description   = %q{Ruboty plugin to show horesase-boys.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
