class ChangeTable < ActiveRecord::Migration
	def change
		remove_column :dresses, :dress_num
		remove_column :dresses, :name
		remove_column :dresses, :color
		remove_column :dresses, :price
		remove_column :dresses, :sale_price
		remove_column :dresses, :sizes
		remove_column :dresses, :images
		remove_column :dresses, :reviews
		remove_column :dresses, :reviews_link
		remove_column :dresses, :video
		remove_column :dresses, :brand
		remove_column :dresses, :retailer
		remove_column :dresses, :link
		
		add_column :dresses, :program, :string
		add_column :dresses, :programUrl, :string
		add_column :dresses, :catalogName, :string
		add_column :dresses, :lastUpdated, :string
		add_column :dresses, :name, :string
		add_column :dresses, :description, :text
		add_column :dresses, :sku, :string
		add_column :dresses, :manufacturer, :string
		add_column :dresses, :manufacturerID, :string
		add_column :dresses, :upc, :string
		add_column :dresses, :currency, :string
		add_column :dresses, :salePrice, :float
		add_column :dresses, :price, :float
		add_column :dresses, :retailPrice, :float
		add_column :dresses, :fromPrice, :float
		add_column :dresses, :buyUrl, :string
		add_column :dresses, :impressionUrl, :string
		add_column :dresses, :imageUrl, :string
		add_column :dresses, :category, :string
		add_column :dresses, :thirdpartyID, :string
		add_column :dresses, :thirdpartyCategory, :string
		add_column :dresses, :label, :string
		add_column :dresses, :format, :string
		add_column :dresses, :special, :string
		add_column :dresses, :gift, :string
		add_column :dresses, :promotionalTect, :string
		add_column :dresses, :instock, :string
		add_column :dresses, :shipping, :float
	end
end
