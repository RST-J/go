class Game < ApplicationRecord
  enum board_size: {small: 0, medium: 1, large: 2}

  belongs_to :user
  belongs_to :black
  belongs_to :white

  validates :name, :user, presence: true
end
