class CreateRecordFavoritePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :record_favorite_players do |t|
      t.references :record, null: false, foreign_key: true
      t.references :favorite_player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
