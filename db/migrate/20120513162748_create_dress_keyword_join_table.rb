class CreateDressKeywordJoinTable < ActiveRecord::Migration
  def up
  	create_table :keywords_dresses, :id => false do |t|
  		t.integer :dress_id
  		t.integer :keyword_id
  	end
  end

  def down
  	drop_table :keywords_dresses
  end
end
