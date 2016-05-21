# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pry_testcase/version'

Gem::Specification.new do |spec|
  spec.name          = "pry_testcase"
  spec.version       = PryTestcase::VERSION
  spec.authors       = ["Masataka Kuwabara"]
  spec.email         = ["p.ck.t22@gmail.com"]

  spec.summary       = %q{Run binding.pry only specified testcase.}
  spec.description   = %q{Run binding.pry only specified testcase.}
  spec.homepage      = "https://github.com/pocke/pry_testcase"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.license       = 'CC0-1.0'

  spec.add_runtime_dependency 'pry', '~> 0.10.3'
  spec.add_runtime_dependency 'binding_of_caller', '~> 0.7.2'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4.0"
  spec.add_development_dependency "rspec-power_assert", "~> 0.3.0"
  spec.add_development_dependency "guard", "~> 2.13.0"
  spec.add_development_dependency "guard-bundler", "~> 2.1.0"
  spec.add_development_dependency "guard-rspec", "~> 4.6.4"
end
