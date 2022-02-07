require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    
    it "should have a name" do
      @product = Product.new
      @product.valid?
      expect(@product.errors[:name].size).to eq(1)
    end
    it "should have a quantity" do
      @product = Product.new
      @product.valid?
      expect(@product.errors[:quantity].size).to eq(1)
    end
    it "should have a category" do
      @product = Product.new
      @product.valid?
      expect(@product.errors[:category].size).to eq(1)
    end
    it "should have a price_cents" do
      @product = Product.new
      @product.valid?
      expect(@product.errors[:price_cents].size).to eq(1)
    end
    it "should have a price" do
      @product = Product.new
      @product.valid?
      expect(@product.errors[:price].size).to eq(2)
    end
  end
end
