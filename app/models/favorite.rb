class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :users, dependent: :destroy
  has_many :posts, dependent: :destroy
end
