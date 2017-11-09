# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/classlink/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-classlink"
  gem.version       = Omniauth::ClassLink::VERSION
  gem.authors       = ["Kamil Bednarz"]
  gem.email         = ["kamil.bednarz@u2i.com"]
  gem.description   = %q{Unofficial OmniAuth strategy for ClassLink SSO OAuth2 integration}
  gem.summary       = %q{The unofficial strategy for authenticating users using launchpad.classlink.com using OAuth2 provider}
  gem.homepage      = "https://github.com/u2i/omniauth-classlink"
  gem.license       = 'Apache2'

  gem.signing_key   = ENV['GEM_PRIVATE_KEY']
  gem.cert_chain    = ['gem-public_cert.pem']

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.1'
end