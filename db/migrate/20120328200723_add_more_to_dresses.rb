class AddMoreToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :brand, :text
    add_column :dresses, :retailer, :text
    add_column :dresses, :link, :text
  end
end
