class Dress < ActiveRecord::Base
	belongs_to :designer
	belongs_to :affiliate
	has_and_belongs_to_many :keywords
	
	
end
