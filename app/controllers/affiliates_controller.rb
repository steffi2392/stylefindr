class AffiliatesController < ApplicationController
	# GET /affiliates
	# GET /affiliates.json
	def index
		@affiliates = Affiliate.all
		@title = "Retailers"
	end
	
	def show
	
		@affiliate = Affiliate.find(params[:id])
		@title = @affiliate.name
		
		@dresses = @affiliate.dresses.page params[:page]
		
		render 'dresses/index'
	end
end