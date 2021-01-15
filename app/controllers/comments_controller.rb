class CommentsController < ApplicationController
	before_action :authenticate_user!

	   def new
	   	@post = Post.find(params[:post_id])
    	@comment = @post.comments.new(parent_id: params[:parent_id])

	   end

	   def create
	    @post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)

		@comment.post_id = @post.id
		@comment.user_id = current_user.id

		respond_to do |format|
	      if @comment.save
	        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
	        format.json { render :show, status: :created, location: @comment }
	      else
	        format.html { render :new }
	        format.json { render json: @comment.errors, status: :unprocessable_entity }
	      end
	    end

	  end

    private

    def comment_params
    	params.require(:comment).permit(:comment, :parent_id, :user_id)
    end

end
