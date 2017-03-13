class CreateWines < ActiveRecord::Migration[5.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :vineyard
      t.string :region
      t.string :type
      t.integer :year
      t.decimal :price
      t.text :note

      t.timestamps
    end
  end
end
