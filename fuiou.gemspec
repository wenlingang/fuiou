# frozen_string_literal: true

require_relative "lib/fuiou/version"

Gem::Specification.new do |spec|
  spec.name          = "fuiou"
  spec.version       = Fuiou::VERSION
  spec.authors       = ["wen"]
  spec.email         = ["wen.sprint@gmail.com"]
  spec.summary       = "An unofficial simple fuiou pay gem"
  spec.description   = "An unofficial simple fuiou pay gem"
  spec.license       = "MIT"

  spec.require_paths = ["lib"]
  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  spec.test_files = Dir["test/**/*"]

  spec.add_runtime_dependency "rest-client", '>= 2.0.0'
  spec.add_runtime_dependency "activesupport", '>= 3.2'

  spec.add_development_dependency "rake", '>= 12.3.3'
  spec.add_development_dependency "webmock", '~> 2.3'
  spec.add_development_dependency "minitest", '~> 5'
end
