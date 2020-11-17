class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :room_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true
end
