class Record < ApplicationRecord
  has_many :record_favorite_players, dependent: :destroy
  has_many :favorite_players, through: :record_favorite_players
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :watched_on, presence: true
end
