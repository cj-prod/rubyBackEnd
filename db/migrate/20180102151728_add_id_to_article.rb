class AddIdToArticle < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :category_id, :integer
  end
end
