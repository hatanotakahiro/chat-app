class Message < ApplicationRecord
  belongs_to :room  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション

  validates :content, presence: true
end
