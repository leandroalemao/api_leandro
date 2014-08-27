class Product < ActiveRecord::Base
  def self.search(search,combo)
	if !search.nil? && combo  == 'id'
	  where(['id LIKE :search', search: "%#{search}%"])
	elsif !search.nil? && combo  == 'code'
	  where(['code LIKE :search', search: "%#{search}%"])
	else
	  Product.all
	end
  end
end
