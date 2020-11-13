class Profile < ApplicationRecord
  validates :introduction, presence: true
  validates :image, presence: true
  validates :age, presence: true
  validates :nickname, presence: true
  validates :price, presence: true
  enum sex: { man: 0, woman: 1}
  belongs_to :user
  has_many :purchases
  has_many :purchase_users, through: :purchases, source: 'user'
  mount_uploader :image, ImageUploader
end
