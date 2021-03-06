# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'neovimrc/version'

Gem::Specification.new do |spec|
  spec.name          = "neovimrc"
  spec.version       = Neovimrc::VERSION
  spec.authors       = ["jimxl"]
  spec.email         = ["tianxiaxl@gmail.com"]

  spec.summary       = %q{我的neovim配置}
  spec.description   = %q{我的neovim配置}
  spec.homepage      = "http://dreamcoder.info"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "commander", "~> 4.3.4"
end
