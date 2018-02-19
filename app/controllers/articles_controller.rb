class ArticlesController < ApplicationController
	#http_basic_authenticate_with name: "cj", password:"1234", except: [:index, :show]
	before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

	include ArticlesHelper
	def index
		@articles = Article.all
	end
	def show
		if not logged_in?
			if Article.find(params[:id]).published == true
				@article = Article.find(params[:id])
			else
				
				redirect_to articles_url
			end
		else
			@article = Article.find(params[:id])
		end
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		if current_user.role == 'redactor'
			@article.published = false
		end
		@article.writenby = current_user.email
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
		if current_user.role == 'redactor'
			@article.published = false
		end
		@article.update(article_params)


		flash.notice = "Article '#{@article.title}' Updated"
		redirect_to article_path(@article)
	end

	
end
