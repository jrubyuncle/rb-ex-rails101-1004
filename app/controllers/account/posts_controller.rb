class Account::PostsController < ApplicationController
	def index
		#@posts = current_user.posts.order("updated_at DESC")
		@posts = current_user.posts.recent
	end
end
