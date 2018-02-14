class TagsController < ApplicationController
	before_action :require_login, only: [:index, :show, :destroy]
	def index
		@tags = Tag.all
	end
	def show
		@tag = Tag.find(params[:id])
	end
	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		flash.notice = "Tag '#{@tag.name}' Destroyed"
		redirect_to tags_url
	end
end
