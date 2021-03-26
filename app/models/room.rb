class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy # roomが消えたら紐づいたuser_idも消える
  has_many :users, through: :room_users  
  has_many :messages, dependent: :destroy # roomが消えたら紐づいたmessagesも消える

  validates :name, presence: true
end
