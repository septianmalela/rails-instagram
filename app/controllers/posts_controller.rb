class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :post_params

	def index
		@post = current_user.feed
		# @posts = Post.where(:user_id => current_user.followings.id)
	end

	def new
		@post = Post.new
		@attachment_post = @post.attachment_posts.build
	end

	def show
		@post = Post.find(params[:id])
		@attachment_posts = @post.attachment_posts.all

		@comment = Comment.new
	end
	
	def create
		content = params[:post][:content]
		@post = current_user.posts.new(content: content)
		if @post.save
			params[:attachment_posts]['foto'].each do |a|
              @attachment_post = @post.attachment_posts.create!(:foto => a, :post_id => @post.id)
          end
              flash[:notice] = "Succes Create Post"
              redirect_to root_path
      	else
      		flash[:notice] = "Fail Create New Post"
      		redirect_to new_post_path
		end
	end

	def destroy
	    @post = Post.find(params[:id])
    	@post.destroy

    	redirect_to root_path
	end

    def like_posts
	  @post = Post.find(params[:id])
      like_posts = @post.likes.find_or_create_by(post_id: @post.id, user: current_user)
      redirect_back fallback_location: root_path(@post.id)
    end

    def dislike_posts
    	q = Post.find(params[:id])
    	w = q.likes
    	e = w.find_by(post_id: params[:id], user_id: current_user.id)
    	if e.user_id == current_user.id
	      a = Post.find(params[:id])
	      b = a.likes
	      c = b.find_by(post_id: params[:id], user_id: current_user.id)
	      d = c.destroy
	      redirect_back fallback_location: root_path(a.id)
    		else
	      redirect_back fallback_location: root_path(a.id)
    	end
    end

	private

	def post_params
		params.permit(attachment_posts_attributes: [:id, :post_id, :foto])
	end

end
