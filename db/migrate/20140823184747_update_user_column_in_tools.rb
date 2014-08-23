class UpdateUserColumnInTools < ActiveRecord::Migration
  def change
    rename_column :tools, :user_id_id, :user_id
  end
end
