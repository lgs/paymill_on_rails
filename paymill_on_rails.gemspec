$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "paymill_on_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "paymill_on_rails"
  s.version     = PaymillOnRails::VERSION
  s.license 	= 'MIT'

  s.authors     = ["Luca G. Soave"]
  s.email       = ["luca.soave@gmail.com"]
  s.homepage    = "https://github.com/lgs/paymill_on_rails"

  s.summary     = "Paymill subscriptions with Rails 4.1.6"
  s.description = "A rails engine to integrate Paymill subscriptions within your Rails 4.1.6 application, out of the box"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "paymill", "~> 0.5.1"

  s.add_dependency "sqlite3"
end
