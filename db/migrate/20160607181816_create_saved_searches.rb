class CreateSavedSearches < ActiveRecord::Migration
  def change
    create_table :saved_searches do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.text :description
      t.text :params
      t.text :searched_index

      t.timestamps null: false
    end
  end
end
