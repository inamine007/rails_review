class CreateFavolites < ActiveRecord::Migration[6.1]
  def change
    create_table :favolites do |t|
      t.string :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end
