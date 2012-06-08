class RemoveKeysFromDresses < ActiveRecord::Migration
  def up
    remove_column :dresses, :keys
  end

  def down
    add_column :dresses, :keys, :text
  end
end
