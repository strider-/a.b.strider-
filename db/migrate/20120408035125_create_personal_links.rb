class CreatePersonalLinks < ActiveRecord::Migration
  def change
    create_table :personal_links do |t|
      t.string :title
      t.string :link
      t.string :code

      t.timestamps
    end
  end
end
