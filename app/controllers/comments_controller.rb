class CommentsController < ApplicationController

def create
	@post = Post.find(params[:post_id])
	@comment = Post.find(params[:post_id]).comments.create(params[:comment])
	if @comment.save
		redirect_to post_path(@post)
	else
		redirect_to post_path(@post)
	end
	render :template => "posts/show"
end

def destroy
	@comment = Comment.find(params[:id])
	@comment.destroy
	render json: { comment: @comment }
end


end