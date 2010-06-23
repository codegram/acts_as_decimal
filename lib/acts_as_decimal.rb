require 'acts_as_decimal/acts_as_decimal'
require 'active_record'

ActiveRecord::Base.send :include, ActsAsDecimal
