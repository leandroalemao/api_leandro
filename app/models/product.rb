class Product < ActiveRecord::Base

  validates :code, :price, presence: true

  scope :search_by_id, -> (params) { where(id: params[:id]) }

  def self.search(params = {})
  	#params = {id: 1} 
  	scope = Product.all
  	scope = scope.search_by_id(params) if params[:id].present?
  	scope = scope.where(code: params[:code]) if params[:code].present?
  	scope
  end
end
