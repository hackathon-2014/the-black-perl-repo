class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.references :user
      t.text :image_url
      t.references :category
      t.boolean :checked_out?, default: false
      t.timestamp
    end
  end
end
