class AddKeysToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :keys, :text
  end
end
