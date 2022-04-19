class CategoriesController < ApplicationController
	before_action :set_category, only: [:show]

	def new

		
	end

	def create
		@category = Category.new(get_category_params)
		if @category.save
			flash[:notice] = "Category was created successfully"
			redirect_to category_path(@category.id)
		else
			render 'new'
		end
		
	end

	def index
		
	end

	def show
		
	end


	private
	def set_category
		@category = Category.find(params[:id])
	end

	def get_category_params
		params.require(:category).permit(:name)
	end
	
end