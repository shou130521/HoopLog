class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :records, dependent: :destroy
  has_many :favorite_players, dependent: :destroy
end
