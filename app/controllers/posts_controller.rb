class PostsController < ApplicationController
  def create
    @post = current_user.posts.create(post_params)
    authorize @post
    if @post.save
      flash[:success] = "Yep! Nice new post, bro!"
      respond_to do |format|
        format.html { redirect_back fallback_location: @post }
        format.js
      end
    else
      flash[:danger] = "Be careful, bro!"
      respond_to do |format|
        format.html { redirect_back fallback_location: @post }
        format.js
      end
    end  
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    flash[:success] = "Post deleted!"
    respond_to do |format|
      format.html { redirect_back fallback_location: @post }
      format.js
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end