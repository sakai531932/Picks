class User < ApplicationRecord
  RULE =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, format: {with: RULE}
  validates :password, length: { in: 8..32 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :password_confirmation, length: { in: 8..32 } 
  has_secure_password
end
