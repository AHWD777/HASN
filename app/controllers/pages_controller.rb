class PagesController < ApplicationController

  def home
    @posts = Post.all
    @newPost = Post.new
    @myPosts = Post.all.where("user_id = ?", User.find_by_username(current_user.username))
  end

  def index
  end

  def profile
  	if (User.find_by_username(params[:id]))
  		@username = params[:id]
  	else
  		redirect_to root_path, :notice=> "User not found!"
  	end

  	@posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]))
    @newPost = Post.new
    @toFollow = User.all.last(5)
  end

  def explore
    @posts = Post.all
    @toFollow = User.all.last(5)
    @newPost = Post.new
    @myPosts = Post.all.where("user_id = ?", User.find_by_username(current_user.username))
  end

end
