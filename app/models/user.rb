class User < ApplicationRecord
  RULE =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, format: {with: RULE}
  validates :password, length: { in: 8..32 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :password_confirmation, length: { in: 8..32 }
 
  has_secure_password
  has_one :profile
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, class_name: "Room", through: :entries
  has_many :purchases
  has_many :purchase_profiles, through: :purchases, source: 'profile'
  enum sex: { man: 0, woman: 1}
  
  acts_as_followable
  acts_as_follower
end
