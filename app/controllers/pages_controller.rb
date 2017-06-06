class PagesController < ApplicationController
  respond_to :js, :json, :html

  def home
    following = Array.new
    for @f in current_user.following do
      following.push(@f.id)
    end

    @posts = Post.where("user_id IN (?)", following)
    @newPost = Post.new
    @myPosts = Post.all.where("user_id = ?", User.find_by_username(current_user.username))

  end

  def search
    search = params[:search]
    redirect_to "/user/#{search}"
  end

  def index
  end

  def profile
  	if (User.find_by_username(params[:id]))
  		@username = params[:id]
  	else
  		redirect_to root_path, :notice=> "User not found!"
  	end

    @posts2 = Post.all.where("user_id = ?", User.find_by_username(current_user.username))
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

  def help
  end

end
