require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "requires price" do
  	product = FactoryGirl.build(:product, price: nil)
  	assert product.valid? == false
  end

  test "requires code" do
    product = FactoryGirl.build(:product, code: nil)
    assert product.valid? == false
    assert product.errors[:code].empty? == false
  end

  test "search returns result when there are more than one product" do
  	2.times do
  	  FactoryGirl.create(:product)
  	end
  	assert Product.search(id: Product.first.id) == [Product.first]
  end

  test "search returns product by code" do
  	product = FactoryGirl.create(:product)
  	assert Product.search(code: product.code).first == product
  end

  test "search returns all product if no params are passed" do
  	2.times do
  	  FactoryGirl.create(:product)
  	end
  	assert Product.search.count == 2
  end

  test "search by id and code returns the product" do
  	2.times do
  	  FactoryGirl.create(:product)
  	end
  	product = Product.first
  	assert Product.search(id: product.id, code: product.code) == [product]
  end 
end
