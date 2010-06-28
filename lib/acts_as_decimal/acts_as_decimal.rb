# ActsAsDecimal
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
        class_eval <<-EOC
          def #{field}
            (self[:#{field}].nil? ? nil : (BigDecimal.new(self[:#{field}].to_s) / BigDecimal('10').power(#{options[:decimals]})).to_f)
          end
          def humanized_#{field}(options = {:thousand_delimiters => true})

            a = #{field}.to_s.split('.')
            b = a[1].ljust(2,'0')

            if options[:thousand_delimiters] == false
              return a[0] + "." + b
            else
              groups = a[0].reverse.scan(/\\d{3}/) 
              rest = a[0].gsub(groups.join.reverse, '').reverse
              groups << rest unless rest.empty?
              return groups.join('.').reverse + "," + b
            end

          end
          def #{field}=(decimalnum)
            self[:#{field}] = (decimalnum.nil? ? nil : (BigDecimal.new(decimalnum.to_s) * BigDecimal('10').power(#{options[:decimals]})).to_i )
          end

          def #{field}_raw
            self[:#{field}]
          end
          def #{field}_raw=(intnum)
            self[:#{field}] = intnum
          end
        EOC
      end
    end

  end

end

