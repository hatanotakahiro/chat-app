class Message < ApplicationRecord
  belongs_to :room  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
