class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    true
  end

  def destroy?
    @user.id == @post.user_id
  end
end