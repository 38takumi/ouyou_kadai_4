class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 2..20 }

  validates :introduction, length: { maximum: 50 }

#プロフィール画像用 deviseに入ってるかも
  attachment :profile_image


end