require 'simplecov'
SimpleCov.start do
  add_group "Lib", "lib"
end
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'acts_as_decimal'
require 'active_record'
require 'rspec'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)

ActiveRecord::Schema.define do
  create_table :products do |t|
    t.string     :name
    t.integer    :price
  end
end

class Product < ActiveRecord::Base
end
