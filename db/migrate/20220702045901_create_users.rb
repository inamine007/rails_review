class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :last_name, :limit => 50
      t.string :first_name, :limit => 50
      t.string :last_name_kana, :limit => 50
      t.string :first_name_kana, :limit => 50
      t.string :email, :limit => 50
      t.string :password
      t.string :icon

      t.timestamps
    end
  end
end
