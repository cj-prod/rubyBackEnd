class ArticlesController < ApplicationController
	#http_basic_authenticate_with name: "cj", password:"1234", except: [:index, :show]
	before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

	include ArticlesHelper
	def index
		@articles = Article.all
	end
	def show
		@article = Article.find(params[:id])
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		if(@article.save)
			redirect_to article_path(@article)
			flash.notice = "Article '#{@article.title}' Created"
		else
			render 'new'
		end
		
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Article '#{@article.title}' Destroyed"
		redirect_to articles_url
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated"
		redirect_to article_path(@article)
	end

	
end
