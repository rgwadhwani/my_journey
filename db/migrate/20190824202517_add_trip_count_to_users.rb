class AddTripCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :trips_count, :integer
  end
end
