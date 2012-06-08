class DropTableKeywordsDresses < ActiveRecord::Migration
  def up
  	drop_table :keywords_dresses
  end

  def down
  	create_table :keywords_dresses, :id => false do |t|
  		t.integer :dress_id
  		t.integer :keyword_id
  	end
  end
end
