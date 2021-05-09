
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jektify/version"

Gem::Specification.new do |spec|
  spec.name          = "jektify"
  spec.version       = Jektify::VERSION
  spec.authors       = ["William C. Canin"]
  spec.email         = ["william.costa.canin@gmail.com"]

  spec.summary       = %q{Jekyll plugin to generate HTML code fragments to incorporate music from Spotify}
  spec.homepage      = "https://github.com/jektify/jektify"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|cdn|pkg|temp|src/dev|.babelrc|gulpfile.babel.js|package.json)}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 3.0.0'

  spec.add_dependency "jekyll", "~> 4.2", "~> 4.2.0"
  spec.add_dependency "sassc", "~> 2.4", "~> 2.4.0"

  spec.add_development_dependency "bundler", "~> 2.2.17"
  spec.add_development_dependency "rake", "~> 13.0.3"
  spec.add_development_dependency "minitest", "~> 5.14.3"

end
