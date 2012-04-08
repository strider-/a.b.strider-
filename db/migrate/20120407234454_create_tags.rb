class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :article_id
      t.string :value

      t.timestamps
    end
  end
end
