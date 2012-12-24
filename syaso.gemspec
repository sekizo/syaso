# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'syaso/version'

Gem::Specification.new do |gem|
  gem.name          = "syaso"
  gem.version       = Syaso::VERSION
  gem.authors       = ["sekizo"]
  gem.email         = ["sekizoworld@mac.com"]
  gem.description   = %q{basic views for ActiveView}
  gem.summary       = %q{helper for ActionView}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  #--------------------#
  # additionals
  gem.add_dependency "actionpack"
  gem.add_development_dependency "shoulda"
  
end
