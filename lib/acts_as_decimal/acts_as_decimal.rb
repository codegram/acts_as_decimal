# encoding: utf-8
module ActsAsDecimal
  require 'bigdecimal'

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
        define_method "human_#{field}" do |options = {:thousand_delimiters => true}|
          
          return nil if self.send(field).blank?
          integral, fractional = self.send(field).to_s.split('.')
          fractional = fractional.ljust(2,'0')

          if options[:thousand_delimiters] == false
            return integral + "." + fractional
          else
            groups = integral.reverse.scan(/\d{3}/) 
            rest = integral.gsub(groups.join.reverse, '').reverse
            groups << rest unless rest.empty?
            if groups.last == '-'
              groups.reject!{|x| x == '-'}
              negative = true
            end
            humanized_string = negative ? "-" : ""
            humanized_string += groups.join('.').reverse + "," + fractional
            return humanized_string
          end

        end

        define_method "#{field}" do
          (self[:"#{field}"].nil? ? nil : (self[:"#{field}"] / BigDecimal('10').power("#{options[:decimals]}".to_i).to_f))
        end

        define_method "#{field}=" do |decimalnum|
          self[:"#{field}"] = (decimalnum.nil? ? nil : (BigDecimal.new(decimalnum.to_s) * BigDecimal('10').power("#{options[:decimals]}".to_i)).to_i )
        end

        define_method "#{field}_raw" do
          self[:"#{field}"]
        end

        define_method "#{field}_raw=" do |intnum|
          self[:"#{field}"] = intnum
        end
      end
    end

  end

end
