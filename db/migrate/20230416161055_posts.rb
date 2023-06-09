class Posts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :year
      t.integer :km
      t.string :region
      t.string :post_status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
