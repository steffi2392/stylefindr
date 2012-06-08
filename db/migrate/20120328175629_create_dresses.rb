class CreateDresses < ActiveRecord::Migration
  def change
    create_table :dresses do |t|

      t.timestamps
    end
  end
end
