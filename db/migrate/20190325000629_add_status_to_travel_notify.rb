class AddStatusToTravelNotify < ActiveRecord::Migration[5.2]
  def change
    add_column :travel_notifies, :status, :integer, default: 0
  end
end
