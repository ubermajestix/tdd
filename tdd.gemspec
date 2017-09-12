# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tdd/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tyler Montgomery"]
  gem.email         = ["tyler.a.montgomery@gmail.com"]
  gem.description   = %q{Fire up that tdd loop}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tdd"
  gem.require_paths = ["lib"]
  gem.version       = Tdd::VERSION
  gem.license = 'MIT'
  

  gem.add_runtime_dependency "main", "~> 5.0"
  gem.add_runtime_dependency "rb-fsevent", "~> 0.10"
  gem.add_runtime_dependency "ruby_gntp"
end
