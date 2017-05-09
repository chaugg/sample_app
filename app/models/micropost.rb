class Micropost < ApplicationRecord
  belongs_to :user

  mount_uploader :picture, PictureUploader

  scope :recent, ->{order created_at: :desc}
  scope :microposts_feed, ->user_ids{where user_id: user_ids}

  validates :user, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validate :picture_size

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, t(".limit_size")
    end
  end
end
