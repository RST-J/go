class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :games
  has_many :games_as_white, class_name: 'Game', foreign_key: :white_id, inverse_of: :white
  has_many :games_as_black, class_name: 'Game', foreign_key: :black_id, inverse_of: :black
end
