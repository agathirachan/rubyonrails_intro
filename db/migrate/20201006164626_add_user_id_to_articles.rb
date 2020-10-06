class AddUserIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :user_id, :int
  end
end
