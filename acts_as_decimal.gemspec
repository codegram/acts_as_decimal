# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts_as_decimal}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Oriol Gual", "Josep M. Bach", "Josep Jaume Rey"]
  s.date = %q{2010-08-09}
  s.description = %q{Rails 3 gem to treat an attribute as a decimal (getting and setting floating-point values) but storing it as an integer in the database (useful for prices and other precision-needed attributes like money).}
  s.email = %q{info@codegram.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".bundle/config",
     ".document",
     ".gitignore",
     ".rspec",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "acts_as_decimal.gemspec",
     "lib/acts_as_decimal.rb",
     "lib/acts_as_decimal/acts_as_decimal.rb",
     "spec/acts_as_decimal_spec.rb",
     "spec/model_builder.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/codegram/acts_as_decimal}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Treat an attribute as if it were a decimal, storing it as an integer in the database.}
  s.test_files = [
    "spec/acts_as_decimal_spec.rb",
     "spec/model_builder.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemodel>, [">= 3.0.0.rc"])
      s.add_development_dependency(%q<rspec>, [">= 2.0.0.beta.19"])
      s.add_development_dependency(%q<activerecord>, [">= 3.0.0.rc"])
    else
      s.add_dependency(%q<activemodel>, [">= 3.0.0.rc"])
      s.add_dependency(%q<rspec>, [">= 2.0.0.beta.19"])
      s.add_dependency(%q<activerecord>, [">= 3.0.0.rc"])
    end
  else
    s.add_dependency(%q<activemodel>, [">= 3.0.0.rc"])
    s.add_dependency(%q<rspec>, [">= 2.0.0.beta.19"])
    s.add_dependency(%q<activerecord>, [">= 3.0.0.rc"])
  end
end

