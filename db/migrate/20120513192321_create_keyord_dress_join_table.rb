class CreateKeyordDressJoinTable < ActiveRecord::Migration
  def up
  	create_table :dresses_keywords, :id => false do |t|
  		t.integer :dress_id
  		t.integer :keyword_id
  	end
  end

  def down
  	drop_table :dresses_keywords
  end
end

