require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "acts_as_decimal"
    gem.summary = "Treat an attribute as a decimal, storing it as an integer in the database."
    gem.description = "Rails 3 gem to treat an attribute as a decimal (storing and retrieving floating-point values) but storing it as an integer in the database (useful for prices and other money attributes)."
    gem.email = "info@codegram.com"
    gem.homepage = "http://github.com/codegram/acts_as_decimal"
    gem.authors = ["Oriol Gual", "Josep Mª Bach", "Josep Jaume Rey"]

    gem.add_dependency 'activerecord', '>= 3.0.0.beta4'

    gem.add_development_dependency "rspec", '>= 2.0.0.beta.12'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

# Rake RSpec2 task stuff
gem 'rspec', '>= 2.0.0.beta.12'
gem 'rspec-expectations'

require 'rspec/core/rake_task'

desc "Run the specs under spec"
RSpec::Core::RakeTask.new do |t|

end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "acts_as_decimal #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
