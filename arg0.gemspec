# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arg0/version'

Gem::Specification.new do |gem|
  gem.name          = "arg0"
  gem.version       = Arg0::VERSION
  gem.authors       = ["abhishekkr"]
  gem.email         = ["abhikumar163@gmail.com"]
  gem.description   = %q{It's just here to handle arguments provided to Application. Mainly optional via switches. Currently handles plain-text Console arguments.}
  gem.summary       = %q{Arg0 is here to handle the ARGs passed to your application.}
  gem.homepage      = "https://github.com/abhishekkr/arg0"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
