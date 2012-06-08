class AddDesignerIdToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :designer_id, :integer
  end
end
