class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.decimal :score, precision: 2, scale: 1
      t.string :book_id
      t.string :title, :limit => 50

      t.timestamps
    end
  end
end
