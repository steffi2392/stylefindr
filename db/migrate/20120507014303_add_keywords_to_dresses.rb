class AddKeywordsToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :keywords, :text
  end
end
