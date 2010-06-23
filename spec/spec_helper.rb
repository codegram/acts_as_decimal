$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'active_record'

require 'lib/acts_as_decimal'
require 'rspec'
require 'rspec/autorun'

RAILS_ENV = "test"
RAILS_VERSION = ENV['RAILS_VERSION'] || '3.0.0.beta4'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)

dir = File.dirname(__FILE__)
require File.join(dir, "model_builder")
include ModelBuilder
