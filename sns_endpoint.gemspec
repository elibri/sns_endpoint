# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sns_endpoint/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Piotr Szmielew"]
  gem.email         = ["p.szmielew@ava.waw.pl"]
  gem.description   = %q{Gem containing sinatra engine to utilize SNS notifications.}
  gem.summary       = %q{Gem containing sinatra engine to utilize SNS notifications.}
  gem.homepage      = "http://github.com/elibri/sns_endpoint"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sns_endpoint"
  gem.require_paths = ["lib"]
  gem.version       = SnsEndpoint::VERSION
  
  
  gem.add_runtime_dependency "httparty"
  gem.add_runtime_dependency "sinatra"
  gem.add_runtime_dependency "json"
end
