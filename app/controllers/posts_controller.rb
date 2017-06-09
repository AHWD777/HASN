class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		respond_to do |f|
			if (@post.save)
				f.html { redirect_to "", notice: "Post created!" }
			else
				f.html { redirect_to "", notice: "An error occured..." }
			end
		end
	end

    def vote
      if !current_user.liked? @p
        @p.liked_by current_user
      elsif current_user.liked? @p
        @p.unliked_by current_user
      end
    end

    def share
    	@cur_user = current_user.username.to_s
    	@post_user = User.find(@p.user_id).username.to_s
    	@content = TEST
    	@post = Post.new("#{@cur_user} shared a post : #{@content}")
		@post.user_id = current_user.id
		respond_to do |f|
			if (@post.save)
				f.html { redirect_to "", notice: "Post shared!" }
			else
				f.html { redirect_to "", notice: "An error occured..." }
			end
		end
    end
    helper_method :share

	private
	def post_params
		params.require(:post).permit(:user_id, :content)
	end

end