class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validate :image_presence
  has_many :likes, dependent: :destroy
  has_many :comments, as: :commentable

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
