class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.string :title
      t.text :body
      t.date :watched_on
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
