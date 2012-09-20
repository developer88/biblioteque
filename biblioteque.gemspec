# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "biblioteque/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Eremin Andrey"]
  gem.email         = ["dsoft88@gmail.com"]
  gem.description   = %q{Local files parser. It parses files stored in a local directories and writes the information into db in JSON format.}
  gem.summary       = %q{Local files parser. It parses files stored in a local directories and writes the information into db in JSON format.}
  gem.homepage      = "http://eremin.me"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "biblioteque"
  gem.require_paths = ["lib"]
  gem.version       = Biblioteque::VERSION

  gem.add_development_dependency "yard" 
  gem.add_development_dependency "minitest"
  gem.add_development_dependency "mocha"  
end
