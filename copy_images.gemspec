# -*- encoding: utf-8 -*-
require File.expand_path('../lib/copy_images/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jamie English"]
  gem.email         = ["jamienglish@gmail.com"]
  gem.description   = %q{Copy supplier images to bransom.}
  gem.summary       = %q{Give me a cleaned up catalog.xml and a directory full of images named by supplier reference and I will copy them to your bsmart directory.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "copy_images"
  gem.require_paths = ["lib"]
  gem.version       = CopyImages::VERSION
  gem.add_development_dependency('rspec', '~> 2.8.0')
  gem.add_development_dependency('cucumber')
  gem.add_development_dependency('aruba')
  gem.add_development_dependency('rake', '~> 0.9.2')
  gem.add_dependency('methadone', '~>1.0.0.rc4')
  gem.add_dependency('roxml', '~> 3.3.1')
end
