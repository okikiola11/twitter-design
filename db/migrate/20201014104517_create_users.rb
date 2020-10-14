class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname
      t.text :photo
      t.text :coverimage

      t.timestamps
    end
  end
end
