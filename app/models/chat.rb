class Chat < ApplicationRecord
  validates :recipient_id, uniqueness: true

  has_many :messages
end
