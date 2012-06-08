module DressesHelper

	def get_lowest_price(dress) 
		if dress.sale_price 
			return dress.sale_price
		else	
			return dress.original_price
		end
	end

end
