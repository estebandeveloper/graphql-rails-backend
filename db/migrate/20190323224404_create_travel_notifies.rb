class CreateTravelNotifies < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_notifies do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.datetime :departure_date
      t.datetime :return_date
      t.integer :klass_type, default: 0
      t.integer :price
      t.integer :bus_travel_id
      t.integer :departure_city_id
      t.integer :destination_city_id

      t.timestamps
    end
  end
end
