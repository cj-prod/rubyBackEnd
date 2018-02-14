class AddRoleToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :role, :string
  end
end
