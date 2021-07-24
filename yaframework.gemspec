# frozen_string_literal: true

require_relative "lib/yaframework/version"

Gem::Specification.new do |spec|
  spec.name          = "yaframework"
  spec.version       = Yaframework::VERSION
  spec.authors       = ["maxbarsukov"]
  spec.email         = ["maximbarsukov@bk.ru"]

  spec.summary       = "Another one minimal Ruby microframework for web development"
  spec.description   = "What could be better than one more Sinatra?"

  spec.homepage      = "https://rubygems.org/gems/yaframework"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["homepage_uri"]     = spec.homepage
  spec.metadata["source_code_uri"]  = "https://github.com/maxbarsukov/yaframework"
  spec.metadata["changelog_uri"]    = "https://github.com/maxbarsukov/yaframework/blob/master/CHANGELOG.md"

  spec.test_files       = Dir["test/**/*.rb"]
  spec.require_paths    = ["lib"]

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }

  spec.add_development_dependency "bundler",  ">= 2.2.10"
  spec.add_development_dependency "rake",     "~> 13.0"
  spec.add_development_dependency "rubocop",  "~> 1.7"

  spec.add_runtime_dependency "rack", "~> 2.2"
end
