class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def index
		@articles = Article.all
	end

	def show
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		@article = Article.new(get_article_params)
		if @article.save
			flash[:notice] = "Article was created successfully."
			redirect_to article_path(@article.id)
		else
			render 'new'
		end
	end

	def update
		if @article.update(get_article_params)
			flash[:notice] = "Article was updated successfully."
			redirect_to article_path(@article.id)
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private
	def set_article
		@article = Article.find(params[:id])
	end

	def get_article_params
		params.require(:article).permit(:title, :description)
	end
end