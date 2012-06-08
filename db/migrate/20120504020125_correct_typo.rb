class CorrectTypo < ActiveRecord::Migration
	def change
		remove_column :dresses, :promotionalTect
		add_column :dresses, :promotionalText, :string
	end
end
