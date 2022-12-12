class PostCommentsController < ApplicationController
  before_action :find_post, only: [:create, :update, :destroy]

  def create
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

  def edit
  end

  def update
    @post_comment = @post.post_comments.find(params[:id])
    if @post_comment.update(post_comment_params)
      redirect_to @post_comment
    end
  end

  def destroy
    @post_comment = @post.post_comments.find(params[:id]).destroy
    redirect_to @post
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:body)
  end

  def find_post
    @post = Post.find(params[:post_id]) 
  end
end