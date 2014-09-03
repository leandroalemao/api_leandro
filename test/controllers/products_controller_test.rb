# require 'test_helper'

# class ProductsControllerTest < ActionController::TestCase
#   setup do
#     @product = products(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:products)
#   end

#   test "should create product" do
#     post :create, product: { code: @product.code, price: @product.price }
#     assert_response 422
#   end

#   test "should show product" do
#     get :show, id: @product
#     assert_response :success
#   end

#   test "should destroy product" do
#     assert_difference('Product.count', -1) do
#       delete :destroy, id: @product
#     end

#     assert_response 204
#   end

#   test "should not save product without price" do
#     product = Product.new
#     assert_not product.save, "Saved the product without a price"
#   end

#   test "should not save product without code" do
#     product = Product.new
#     assert_not product.save, "Saved the product without a code"
#   end
# end
