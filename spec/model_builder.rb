# This is based on Remarkable based on Shoulda model builder for Test::Unit.
#
module ModelBuilder

  def create_table(table_name, &block)
    connection = ActiveRecord::Base.connection

    connection.execute("DROP TABLE IF EXISTS #{table_name}")
    connection.create_table(table_name, &block)
    @created_tables ||= []
    @created_tables << table_name
    connection
  end

  def define_constant(class_name, base, &block)
    class_name = class_name.to_s.camelize

    klass = Class.new(base)
    Object.const_set(class_name, klass)

    klass.class_eval(&block) if block_given?

    @defined_constants ||= []
    @defined_constants << class_name

    klass
  end

  def define_model_class(class_name, &block)
    define_constant(class_name, ActiveRecord::Base, &block)
  end

  def define_model(name, columns = {}, &block)
    class_name = name.to_s.pluralize.classify
    table_name = class_name.tableize

    table = columns.delete(:table) || lambda {|table|
      columns.each do |name, type|
        table.column name, *type
      end
    }

    create_table(table_name, &table)

    klass    = define_model_class(class_name, &block)
    instance = klass.new

    self.class.subject { instance } if self.class.respond_to?(:subject)
    instance
  end

end
