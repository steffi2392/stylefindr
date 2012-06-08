class DesignersController < ApplicationController
	# GET /designers
	# GET /designers.json
	def index
		@designers = Designer.all
		@title = "Designers"
	end
	
	def show
		@designer = Designer.find(params[:id])
		@title = @designer.name
		@dresses = @designer.dresses.page params[:page]
		
		
		
		render 'dresses/index'
	end
end