class PostsController < ApplicationController
  def create
    @post = current_user.posts.create(post_params)
    authorize @post
    if @post.save
      flash[:success] = "Yep! Nice new post, bro!"
      redirect_to @post
    else
      flash[:danger] = "Be careful, bro!"
      redirect_to current_user
    end  
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    flash[:success] = "Post deleted!"
    redirect_to request.referrer || root_path
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end