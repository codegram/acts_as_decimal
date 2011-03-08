require 'spec_helper'

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

    it "sets a price_raw of 2030" do
      subject.price_raw = 2030
      subject.price.should == 20.30
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

  describe "human helpers", "when retrieving the human value (a pretty string)" do

    context "with a 3.900.400,00 price" do

      subject { Product.new(:price => 3_900_400.00) }

      it "has a human_price of 3.900.400,00" do
        subject.human_price.should == "3.900.400,00"
      end

      it "has a human_price(:thousand_delimiters => false) of 3900400,00" do
        subject.human_price(:thousand_delimiters => false).should == "3900400,00"
      end

    end

    context "with a 20.000,00 price" do

      subject { Product.new(:price => 20000.00) }

      it "has a human_price of 20.000,00" do
        subject.human_price.should == "20.000,00"
      end

      it "has a human_price(:thousand_delimiters => false) of 20000,00" do
        subject.human_price(:thousand_delimiters => false).should == "20000,00"
      end

    end

    context "with a 1234.56 price" do

      subject { Product.new(:price => 1234.56) }

      it "has a human_price of 1.234,56" do
        subject.human_price.should == "1.234,56"
      end

      it "has a human_price(:thousand_delimiters => false) of 1234,56" do
        subject.human_price(:thousand_delimiters => false).should == "1234,56"
      end

    end

    context "with a 900,00 price" do

      subject { Product.new(:price => 900.00) }

      it "has a human_price of 900,00" do
        subject.human_price.should == "900,00"
      end

      it "has a human_price(:thousand_delimiters => false) of 900,00" do
        subject.human_price(:thousand_delimiters => false).should == "900,00"
      end

    end

    context "with a string price of '900.00'" do

      subject { Product.new(:price => "900.00") }

      it "has a human_price of 900,00" do
        subject.human_price.should == "900,00"
      end

      it "has a human_price(:thousand_delimiters => false) of 900,00" do
        subject.human_price(:thousand_delimiters => false).should == "900,00"
      end

    end

    context "with a negative float price -900.00" do

      subject { Product.new(:price => -900.00) }

      it "has a human_price of -900,00" do
        subject.human_price.should == "-900,00"
      end

      it "has a human_price(:thousand_delimiters => false) of -900,00" do
        subject.human_price(:thousand_delimiters => false).should == "-900,00"
      end

    end

    context "with a negative string price '-900.00'" do

      subject { Product.new(:price => "-900.00") }

      it "has a human_price of -900,00" do
        subject.human_price.should == "-900,00"
      end

      it "has a human_price(:thousand_delimiters => false) of -900,00" do
        subject.human_price(:thousand_delimiters => false).should == "-900,00"
      end

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
