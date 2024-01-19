class Post < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :likes

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  has_one_attached :image

  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
