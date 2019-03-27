class AddExpiryToTravelNotify < ActiveRecord::Migration[5.2]
  def change
    add_column :travel_notifies, :expiry, :datetime
  end
end
