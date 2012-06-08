class AddColumnsToDresses < ActiveRecord::Migration
  def change
  	add_column :dresses, :dress_num, :integer
  	add_column :dresses, :name, :text
  	add_column :dresses, :color, :text
  	add_column :dresses, :price, :float
  	add_column :dresses, :sale_price, :float
  	add_column :dresses, :sizes, :text
  	add_column :dresses, :images, :text
  	add_column :dresses, :reviews, :integer
  	add_column :dresses, :reviews_link, :text
  	add_column :dresses, :video, :boolean
  end
end
