class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to root_path
  end


  private
  def comment_params  
    params.require(:comment).permit(:body, :user_id)
  end

end

