# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'content_truncate/version'

Gem::Specification.new do |spec|
  spec.name          = "content_truncate"
  spec.version       = ContentTruncate::VERSION
  spec.authors       = ["soffolk"]
  spec.email         = ["zlx.star@gmail.com"]
  spec.description   = %q{smart truncate for content}
  spec.summary       = %q{smart truncate for content}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "active_support", "> 3.0.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
