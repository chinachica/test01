class CommentsController < ApplicationController

def create
	@post = Post.find(params[:post_id])
	@comment = Post.find(params[:post_id]).comments.new(params[:comment])
	@cat = Category.find(@post.category_id)

	if @comment.save
		redirect_to post_path(@post)
		Commentsendmail.sendmail(@comment).deliver
	else
		render :template => "posts/show"
	end
	
end

def destroy
	@comment = Comment.find(params[:id])
	@comment.destroy
	render json: { comment: @comment }
end


end
