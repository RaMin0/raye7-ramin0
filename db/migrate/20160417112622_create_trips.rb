class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.datetime :begins_at
      t.text :source_address
      t.string :source_latitude
      t.string :source_longitude
      t.text :destination_address
      t.string :destination_latitude
      t.string :destination_longitude

      t.timestamps null: false
    end
  end
end
