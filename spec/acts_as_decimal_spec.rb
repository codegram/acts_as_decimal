require 'spec_helper'

create_table "products" do end

define_model('Product', :name => :string, :price => :integer)

class Product < ActiveRecord::Base
  acts_as_decimal :price, :decimals => 2
end

describe Product do

  context "with a price of 10.30" do

    before(:all) do
      Product.acts_as_decimal :price
    end

    subject { Product.new(:price => 10.30)}

    it "has a price of 10.30" do
      subject.price.should == 10.30
    end

    it { should respond_to(:price_raw) }

    it "has a price_raw of 1030" do
      subject.price_raw.should == 1030
    end

    it "stores 1030 to the database" do
      subject.attributes["price"].should == 1030
    end

    it "handles nil values with dignity" do
      subject.price = nil

      subject.price.should be_nil
      subject.price_raw.should be_nil
    end

  end

  context "with a price of 10.30452 and specifying :decimals => 5" do
  
    before(:all) do
      Product.acts_as_decimal :price, :decimals => 5
    end

    subject { Product.new(:price => 10.30452) }

    it "has a price of 10.30452" do
      subject.price.should == 10.30452
    end

    it "has a price_raw of 10304542" do
      subject.price_raw.should == 1030452
    end

    it "stores 1030452 to the database" do
      subject.attributes["price"].should == 1030452
    end
  
  end

end
