class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :sport
      t.date :date
      t.time :time
      t.string :location
      t.integer :spots
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
