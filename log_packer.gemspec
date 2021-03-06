# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'log_packer/version'

Gem::Specification.new do |spec|
  spec.name          = "log_packer"
  spec.version       = LogPacker::VERSION
  spec.authors       = ["yakjuly"]
  spec.email         = ["yakjuly@gmail.com"]
  spec.description   = %q{Log Packer is a tool to package rails log to log/archive folder}
  spec.summary       = %q{Ususally work with whenever to archive log every night}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
