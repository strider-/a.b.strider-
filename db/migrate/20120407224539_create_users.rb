class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :nickname
      t.string :email
      t.datetime :birthday

      t.timestamps
    end
  end
end
