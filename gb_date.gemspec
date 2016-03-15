# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gb_date/version'

Gem::Specification.new do |spec|
  spec.name          = 'gb_date'
  spec.version       = GBDate::VERSION
  spec.authors       = ['Kacper Kawecki']
  spec.email         = ['kacper@geniebelt.com']

  spec.summary       = %q{Add to rails parsing date and time from float or integer}
  spec.description   = %q{Add to rails parsing date and time from float or integer}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 4.0'
  spec.add_dependency 'activesupport', '>= 4.0'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'pg'
end
