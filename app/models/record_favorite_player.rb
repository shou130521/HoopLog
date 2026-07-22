class RecordFavoritePlayer < ApplicationRecord
  belongs_to :record
  belongs_to :favorite_player
end
