class PostCommentPolicy
  attr_reader :user, :post_comment

  def initialize(user, post_comment)
    @user = user
    @post_comment = post_comment
  end

  def update?
    @user.id == @post_comment.user_id
  end

  def edit?
    @user.id == @post_comment.user_id
  end

  def create?
    true
  end

  def destroy?
    @user.id == @post_comment.user_id
  end
end