class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

  def favorited(post)
    favorites.where(post_id: post.id).first
  end

  def voted(post)
    votes.where(post_id: post.id).first
  end

  def self.top_rated
    self.select('users.*') #select all user's attributes
        .select('COUNT(DISTINCT comments.id) AS comments_count') #count the comments made by the user
        .select('COUNT(DISTINCT posts.id) AS posts_count') #count posts made by the user
        .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank')
        .joins(:posts) #ties the posts table to the users table via user_id
        .joins(:comments) #ties the comments table to the users table, via the user_id
        .group('users.id')
        .order('rank DESC')
  end
end
