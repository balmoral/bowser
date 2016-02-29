# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bowser/version'

Gem::Specification.new do |spec|
  spec.name          = "bowser"
  spec.version       = Bowser::VERSION
  spec.authors       = ["Jamie Gaskins"]
  spec.email         = ["jgaskins@gmail.com"]

  spec.summary       = %q{Minimalist browser support for Opal apps}
  spec.homepage      = "https://github.com/clearwater-rb/bowser"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "opal", "~> 0.8.0"
end
