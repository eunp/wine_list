class AddSizeToWines < ActiveRecord::Migration[5.0]
  def change
    add_column :wines, :size, :string
  end
end
