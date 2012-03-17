$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hyperimage/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hyperimage"
  s.version     = Hyperimage::VERSION
  s.authors     = ["Erik Michaels-Ober"]
  s.email       = ["sferik@gmail.com"]
  s.homepage    = "https://github.com/sferik/mwrc2012-app"
  s.summary     = "Convert images!"
  s.description = "It's awesome!"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.2"
  s.add_dependency "rmagick"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
