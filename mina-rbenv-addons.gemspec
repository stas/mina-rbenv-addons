# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "mina-rbenv-addons"
  spec.version       = '0.1'
  spec.authors       = ["Stas SUȘCOV"]
  spec.email         = ["stas@nerd.ro"]
  spec.summary       = %q{Mina Rbenv addons.}
  spec.description   = %q{Use mina to upgrade your ruby/rbenv version.}
  spec.homepage      = "https://github.com/stas/mina-rbenv-addons"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mina", "~> 1.0.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
