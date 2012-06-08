class AddStuffToDresses < ActiveRecord::Migration
  def change
  	add_column :dresses, :name, :text
  	add_column :dresses, :description, :text
  	add_column :dresses, :sku, :text
  	add_column :dresses, :sale_price, :float
  	add_column :dresses, :original_price, :float
  	add_column :dresses, :retail_price, :float
	add_column :dresses, :url, :text
	add_column :dresses, :image_url, :text
	add_column :dresses, :promotion, :text
	add_column :dresses, :designer_id, :integer
	add_column :dresses, :affiliate_id, :integer
  end
end
