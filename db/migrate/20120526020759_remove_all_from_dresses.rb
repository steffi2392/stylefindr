class RemoveAllFromDresses < ActiveRecord::Migration
  def up
  	remove_column :dresses, :program
  	remove_column :dresses, :programUrl
  	remove_column :dresses, :catalogName
  	remove_column :dresses, :lastUpdated
  	remove_column :dresses, :name
  	remove_column :dresses, :description
  	remove_column :dresses, :sku
  	remove_column :dresses, :manufacturer
  	remove_column :dresses, :manufacturerID
  	remove_column :dresses, :upc
  	remove_column :dresses, :currency
  	remove_column :dresses, :salePrice
  	remove_column :dresses, :price
  	remove_column :dresses, :retailPrice
  	remove_column :dresses, :fromPrice
  	remove_column :dresses, :buyUrl
  	remove_column :dresses, :impressionUrl
  	remove_column :dresses, :imageUrl
  	remove_column :dresses, :category
  	remove_column :dresses, :thirdpartyID
  	remove_column :dresses, :thirdpartyCategory
  	remove_column :dresses, :label
  	remove_column :dresses, :format
  	remove_column :dresses, :special
  	remove_column :dresses, :gift
  	remove_column :dresses, :instock
  	remove_column :dresses, :shipping
  	remove_column :dresses, :promotionalText
  	remove_column :dresses, :designer_id
  end

  def down
  end
end
