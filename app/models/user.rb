class User < ApplicationRecord
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  has_secure_password

  has_many :receipts
  has_many :favourites
  has_many :subscribers, class_name: "Subscription", foreign_key:  :follower_id
  has_many :subscriptions, class_name: "Subscription", foreign_key: :follow_id
end