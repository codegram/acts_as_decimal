# encoding: utf-8
module ActsAsDecimal
  require 'bigdecimal'
  require 'action_view'
  include ActionView::Helpers::NumberHelper

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # Implements integer handling as floating numbers.
    # Usage:
    #
    # Inside a model with a price or amount field, simply put
    #
    #   acts_as_decimal field_name, :decimals => 2
    #
    def acts_as_decimal(attr_name, options = {:decimals => 2})
      fields = [attr_name] unless attr_name.is_a? Array
      fields.each do |field|
        define_method "human_#{field}" do |*human_options|
          ActiveSupport::Deprecation.warn("acts_as_decimal: The human helper has been deprecated. Please use #{field}.number_with_precision, directly in your views. More info: http://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html#method-i-number_with_precision")

          human_options = human_options.first || {:thousand_delimiters => true}
          return number_with_precision(self.send(field), :delimiter => (human_options[:thousand_delimiters] ? '.' : ''), :separator => ',', :precision => 2)   
        end

        define_method "#{field}" do
          if value = read_attribute("#{field}")
            value / BigDecimal('10').power("#{options[:decimals]}".to_i).to_f
          end
        end

        define_method "#{field}=" do |decimalnum|
          value = unless decimalnum.nil?
            (BigDecimal.new(decimalnum.to_s) * BigDecimal('10').power("#{options[:decimals]}".to_i)).to_i
          end
          write_attribute("#{field}", value || nil)
        end

        define_method "#{field}_raw" do
          read_attribute("#{field}")
        end

        define_method "#{field}_raw=" do |value|
          write_attribute("#{field}", value)
        end
      end
    end

  end

end
