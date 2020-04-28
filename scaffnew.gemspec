# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scaffnew/params'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 1.9.3'
  spec.requirements << 'tar'
  spec.requirements << 'wget'

  spec.name          = "scaffnew"
  spec.version       = Scaffnew::VERSION
  spec.authors       = ["Mar, G."]
  spec.email         = ["gfmarster@gmail.com"]

  spec.summary       = %q{A simple scaffold for many purposes.}
  spec.homepage      = "https://github.com/guilhermemar/scaffnew"
  spec.license       = "GPL-3.0"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|vagrantfile)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["scaff", "scaffnew"]
  spec.require_paths = ["lib"]

  spec.post_install_message = %q{scaffnew successfully installed, just type 'scaff' in terminal to start use}

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
