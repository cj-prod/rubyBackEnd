class AddWritenbyToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :writenby, :string
  end
end
