

	desc "Import dresses."
	task :import_dresses => :environment do
		File.open("dresses.txt", "r").each_line do |line|
			dress_num, brand, retailer, link, name, color, price, sale_price, sizes, image1, image2, image3, reviews, reviews_link, video = line.strip.split("\t")
			d = Dress.new(:dress_num => dress_num, :brand => brand, :retailer => retailer, :link => link, :name => name, :color => color, :price => price, :sale_price => sale_price, :sizes => sizes, :images => image1, :reviews => reviews, :reviews_link => reviews_link, :video => video)
			d.save
		end
	end
	
	desc "Test"
	task :test_data do
		File.open("dresses.txt", "r").each_line do |line|
			puts line
		end
	end
	
	desc "EDressMe"
	task :import_edressme => :environment do
		require 'rubygems'
		require 'spreadsheet'
		
		@workbook = Spreadsheet.open("data/eDressMe.xls")
		@worksheet = @workbook.worksheet(0)
		
		#creates a new affiliate object if it doesn't already exist
		@affiliate = Affiliate.find_or_create_by_name("eDressMe")
		
		1.upto @worksheet.last_row_index do |index|
			row = @worksheet.row(index)
			
			#creates a new designer object if it doesn't already exist
			@designer = Designer.find_or_create_by_name(row[8])
			
			#individual dress data, direct from spreadsheet
			@d = @designer.dresses.new
			
			@d.name = row[4]
			@d.description = row[6]
			@d.sku = row[7]
			@d.sale_price = row[13]
			@d.original_price = row[14]
			@d.retail_price = row[15]
			@d.url = row[17]
			@d.image_url = row[19]
			@d.promotion = row[31]
			
			# formatting data
			# all dresses sell at same price, retail price was originally nil
			@d.retail_price = @d.original_price
			
			@d.save
			@affiliate.dresses << @d
			
		end
		
	end
	
	desc "Singer22"
	task :import_singer22 => :environment do
		require 'rubygems'
		require 'spreadsheet'
		
		@workbook = Spreadsheet.open("data/singer22.xls")
		@worksheet = @workbook.worksheet(0)
		
		@affiliate = Affiliate.find_or_create_by_name("Singer 22")
		
		1.upto @worksheet.last_row_index do |index|
			row = @worksheet.row(index)
			
			#creates a new designer object if it doesn't already exist
			@designer = Designer.find_or_create_by_name(row[8])
			
			#individual dress data, direct from spreadsheet
			@d = @designer.dresses.new
			
			@d.name = row[4]
			@d.description = row[6]
			@d.sku = row[7]
			@d.sale_price = row[13]
			@d.original_price = row[14]
			@d.retail_price = row[15]
			@d.url = row[17]
			@d.image_url = row[19]
			@d.promotion = row[31]
			
			# formatting data
			
			#getting just the name
			if @designer.name and @d.name 
				@designer.name = @designer.name.split
				@d.name = @d.name.split 
				# delete the designer's name from the dress name
				@d.name.delete_if {|x| @designer.name.include? x }
				#put them back into a string with spaces in between
				@keys = @d.name # store array into keywords
				@d.name = @d.name.join(' ')
				@designer.name = @designer.name.join(' ')
			
				# prices - always has a price, only has a retail_price if it differs
				# no sale price
				if @d.retail_price == nil 
					@d.retail_price = @d.sale_price
				end
			
				@d.save
				@affiliate.dresses << @d
			
				@keys.each do |key|
					@keyword = Keyword.find_or_create_by_name(key)
					@d.keywords << @keyword
				end	
			end
			
		end
		
	end
		
	desc "Shopbop"
	task :import_shopbop => :environment do
		require 'rubygems'
		require 'spreadsheet'
		
		@workbook = Spreadsheet.open("data/shopbop.xls")
		@worksheet = @workbook.worksheet(0)
		
		# creates a new affiliate object if it doesn't already exist
		@affiliate = Affiliate.find_or_create_by_name("Shopbop")
		
		1.upto @worksheet.last_row_index do |index|
			row = @worksheet.row(index)
			
			#creates a new designer object if it doesn't already exist
			@designer = Designer.find_or_create_by_name(row[8])
			
			#individual dress data, direct from spreadsheet
			@d = @designer.dresses.new
			
			@d.name = row[4].to_s 
			@d.description = row[6]
			@d.sku = row[7]
			@d.sale_price = row[13]
			@d.original_price = row[14]
			@d.retail_price = row[15]
			@d.url = row[17]
			@d.image_url = row[19]
			@d.promotion = row[31]
			
			# formatting data
			
			#getting just the name
			@designer.name = @designer.name.split
			@d.name = @d.name.split 
			# delete the designer's name from the dress name
			@d.name.delete_if {|x| @designer.name.include? x }
			#put them back into a string with spaces in between
			@d.name = @d.name.join(' ')
			@designer.name = @designer.name.join(' ')
			
			@d.save
			@affiliate.dresses << @d
			
		end
	
	end
	
	desc "Chick Downtown"
	task :import_chick => :environment do
		require 'rubygems'
		require 'spreadsheet'
		
		@workbook = Spreadsheet.open("data/chick.xls")
		@worksheet = @workbook.worksheet(0)
		
		# creates a new affiliate object if it doesn't already exist
		@affiliate = Affiliate.find_or_create_by_name("Chick Downtown")
		
		1.upto @worksheet.last_row_index do |index|
			row = @worksheet.row(index)
			
			# creates a new designer object if it doesn't already exist
			@designer = Designer.find_or_create_by_name(row[8].to_s)
			
			# individual dress data, direct from spreadsheet
			@d = @designer.dresses.new
			
			@d.name = row[4]
			@d.description = row[6]
			@d.sku = row[7]
			@d.sale_price = row[13]
			@d.original_price = row[14]
			@d.retail_price = row[15]
			@d.url = row[17]
			@d.image_url = row[19]
			@d.promotion = row[31]
			
			# formatting data
			
			#getting just the name
			@designer.name = @designer.name.split
			@d.name = @d.name.split 
			# delete the designer's name from the dress name
			@d.name.delete_if {|x| @designer.name.include? x }
			#deletes the number from the dress name
			@d.name.delete_at(0)
			@keys = @d.name # store array into keywords
			#put them back into a string with spaces in between
			@d.name = @d.name.join(' ')
			@designer.name = @designer.name.join(' ')
			
			# pricing: sale price only exists if it is a sale
			if @d.sale_price == @d.original_price
				@d.sale_price = nil
			end
			
			@keys.each do |key|
				@keyword = Keyword.find_or_create_by_name(key)
				@d.keywords << @keyword
			end
			
			@d.save
			@affiliate.dresses << @d
			
		end
	end
	
	
	desc "Trying spreadsheet."
	task :import_dresses_spreadsheet => :environment do
		require 'rubygems'
		require 'spreadsheet'
		
		@sheets = ["data/eDressMe1.xls", "data/shopbop.xls", "data/singer22.xls", "data/chick.xls"]
		
		@sheets.each do |sheet|
		
			workbook = Spreadsheet.open(sheet)
			worksheet = workbook.worksheet(0)
		
			1.upto worksheet.last_row_index do |index|
				row = worksheet.row(index)
			
				@des = Designer.where(:name => row[8]).first
				if @des == nil
					@des = Designer.new
					@des.name = row[8]
					@des.save
				end
		
				d = @des.dresses.new
				d.program = row[0]
				d.programUrl = row[1]
				d.catalogName = row[2]
				d.lastUpdated = row[3]
				d.name = row[4]
				d.description = row[6]
				d.sku = row[7]
				d.manufacturer = row[8]
				d.manufacturerID = row[9]
				d.upc = row[10]
				d.currency = row[12]
				d.salePrice = row[13]
				d.price = row[14]
				d.retailPrice = row[15]
				d.fromPrice = row[16]
				d.buyUrl = row[17]
				d.impressionUrl = row[18]
				d.imageUrl = row[19]
				d.category = row[20]
				d.thirdpartyID = row[21]
				d.thirdpartyCategory = row[22]
				d.label = row[27]
				d.format = row[28]
				d.special = row[29]
				d.gift = row[30]
				d.promotionalText = row[31]
				d.instock = row[36]
				d.shipping = row[37]
			
				d.save
			
			
				@keys = row[5].split(/[ ,]/).to_set
				@keys.each do |key|
					@keyword = Keyword.where(:name => key).first
					if @keyword == nil
						@keyword = Keyword.new(:name => key)
						@keyword.save
					end 
				
					d.keywords << @keyword	
				end
			
			end
			
		end
	end

