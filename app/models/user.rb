class User < ApplicationRecord  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :chats, dependent: :destroy
  
  validates :name, presence: true
end
