class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  #followingについて
  # 【class_name: "Relationship"】は省略可能
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 与フォロー関係を通じて参照→follower_idをフォローしている人　定義したのでfollowingsはモデルのように”.followings”とかで使える
  has_many :followings, through: :relationships, source: :followed
  #followingについてここまで

  #followerについて
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
   # 被フォロー関係を通じて参照→followed_idをフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  #followerについてここまで


def follow(user_id)
  relationships.create(followed_id: user_id)
end

def unfollow(user_id)
  relationships.find_by(followed_id: user_id).destroy
end

def following?(user)
  followings.include?(user)
end


  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 2..20 }

  validates :introduction, length: { maximum: 50 }

  #プロフィール画像用
  attachment :profile_image
end