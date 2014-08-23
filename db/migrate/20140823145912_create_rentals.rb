class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :user
      t.references :tool
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
