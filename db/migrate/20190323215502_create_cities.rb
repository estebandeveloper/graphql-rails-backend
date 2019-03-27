class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :url_name
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :url
    end
  end
end
