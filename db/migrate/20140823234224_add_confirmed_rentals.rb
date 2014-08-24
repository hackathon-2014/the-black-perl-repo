class AddConfirmedRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :confirmed?, :boolean, default: false
  end
end
