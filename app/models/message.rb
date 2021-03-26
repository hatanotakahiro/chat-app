class Message < ApplicationRecord
  belongs_to :room  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
  has_one_attached :image

  validates :content, presence: true
end
