class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.string :title
      t.text :content

      # N - 1 association with users table
      t.belongs_to :user

      t.timestamps
    end
  end
end
