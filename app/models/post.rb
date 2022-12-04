class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  validates_presence_of [:title, :body]
end
