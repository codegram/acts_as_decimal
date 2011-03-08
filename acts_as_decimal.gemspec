$:.push File.expand_path("../lib", __FILE__)
require "acts_as_decimal/version"

Gem::Specification.new do |s|
  s.name = %q{acts_as_decimal}
  s.version = ActsAsDecimal::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Oriol Gual", "Josep M. Bach", "Josep Jaume Rey"]
  s.email = %q{info@codegram.com}
  s.homepage = %q{http://github.com/codegram/acts_as_decimal}
  s.summary = %q{Treat an attribute as if it were a decimal, storing it as an integer in the database.}
  s.description = %q{Rails 3 gem to treat an attribute as a decimal (getting and setting floating-point values) but storing it as an integer in the database (useful for prices and other precision-needed attributes like money).}
  s.rubyforge_project = 'acts_as_decimal'

  s.add_runtime_dependency 'activemodel', '~>3.0.0'
  s.add_runtime_dependency 'activesupport', '~>3.0.0'
  s.add_runtime_dependency 'actionpack', '~>3.0.0'

  s.add_development_dependency 'rspec', '~> 2.5.0'
  s.add_development_dependency 'activerecord', '~> 3.0.0'
  s.add_development_dependency 'sqlite3'

  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'bluecloth'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
