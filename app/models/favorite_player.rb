class FavoritePlayer < ApplicationRecord
  has_many :record_favorite_players, dependent: :destroy
  has_many :records, through: :record_favorite_players
  belongs_to :user

  validates :name, presence: true
end
