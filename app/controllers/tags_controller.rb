class TagsController < ApplicationController
	before_action :require_login, only: [:index, :show, :destroy]
	def index
		if current_user.role == 'admin'
			@tags = Tag.all
		end
	end
	def show
		if current_user.role == 'admin'
			@tag = Tag.find(params[:id])
		end
	end
	def destroy
		if current_user.role == 'admin'
			@tag = Tag.find(params[:id])
			@tag.destroy
			flash.notice = "Tag '#{@tag.name}' Destroyed"
			redirect_to tags_url
		end
	end
end
