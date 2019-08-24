class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.string :city_name
      t.date :arrival_date
      t.date :departure_date
      t.integer :trip_id
      t.string :country_name

      t.timestamps
    end
  end
end
