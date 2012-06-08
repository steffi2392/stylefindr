class RemoveKeywordsFromDresses < ActiveRecord::Migration
  def up
  	remove_column :dresses, :keywords
  end

  def down
  	add_column :dresses, :keywords, :string
  end
end
