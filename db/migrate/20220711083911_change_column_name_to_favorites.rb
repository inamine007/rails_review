class ChangeColumnNameToFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :autor_name, :string
    add_column :favorites, :author_name, :string
  end
end
