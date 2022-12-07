class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id]) 
    @post_comment = @post.post_comments.create(post_comment_params.merge({user_id: current_user.id}))
    authorize @post_comment
    if @post_comment.save
      flash[:success] = "Yep! Nice new comment, bro!"
      redirect_to @post
    else
      flash[:danger] = "Be careful, bro!"
      redirect_to @post
    end   
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.find(params[:id]).destroy
    redirect_to @post
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:body)
  end
end