class KeywordsController < ApplicationController
	def show 
		@keyword = Keyword.find(params[:id])
		
		@dresses = @keyword.dresses.page params[:page]
		
		render 'dresses/index'
	end
end
