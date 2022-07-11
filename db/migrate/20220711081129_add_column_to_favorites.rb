class AddColumnToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favolites, :book_name, :string
    add_column :favolites, :autor_name, :string
    add_column :favolites, :book_image, :string

    rename_table :favolites, :favorites
  end
end
