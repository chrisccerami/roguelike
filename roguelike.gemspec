# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roguelike/version'

Gem::Specification.new do |spec|
  spec.name          = "roguelike"
  spec.version       = Roguelike::VERSION
  spec.authors       = ["Chris C Cerami"]
  spec.email         = ["chrisccerami@gmail.com"]
  spec.date          = '2015-07-26'
  spec.summary       = "Create Rogue clones using levels designed in YAML"
  spec.description   = "Roguelike will read your game's YAML file, create levels based on your designs, and then handle all of the logic of building and running a customized Rogue clone for you."
  spec.homepage      = "http://rubygems.org/gems/roguelike"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_path  = "lib"

  spec.required_ruby_version = '~> 2.0'

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency 'commander', '~> 4.3'
end
