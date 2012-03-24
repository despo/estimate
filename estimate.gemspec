$:.push File.expand_path("../lib", __FILE__)
require "estimate/version"

Gem::Specification.new do |s|
  s.name        = "estimate"
  s.version     = Estimate::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = "Despo Pentara"
  s.email       = "despo@extractmethod.com"
  s.homepage    = "https://github.com/despo/estimate"
  s.summary     = "Estimate projects the easy way."
  s.description = %{Have a manager that's been nugging you for a project estimate? Waste no time! Estimate your project now.}
  s.required_ruby_version = '>= 1.9.2'

  s.licenses = ["MIT"]

  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- {spec}/*`.split("\n")
  s.executables        = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths      = ["lib"]

  s.add_dependency "pivotal-tracker", "~> 0.5.1"

  s.add_development_dependency "rspec", "~> 2.8.0"
  s.add_development_dependency "rake"
end

