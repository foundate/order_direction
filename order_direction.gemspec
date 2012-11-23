# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'order_direction/version'

Gem::Specification.new do |gem|
  gem.name          = "order_direction"
  gem.version       = OrderDirection::VERSION
  gem.authors       = ["foundate"]
  gem.email         = ["foundate@gmail.com"]
  gem.description   = "Simple Order"
  gem.summary       = "Simple Order"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  
  gem.add_dependency(%q<rails>, ["3.2.8"])
  gem.add_dependency(%q<rake>, [">= 0.8.0"])
  gem.add_development_dependency(%q<rspec>)
  gem.add_development_dependency(%q<pry>)
  gem.add_development_dependency(%q<sqlite3>)
  gem.add_development_dependency(%q<database_cleaner>)
  
end
