class ChangeColsInWines < ActiveRecord::Migration[5.0]
  def change
    rename_column :wines, :type, :category
  end
end
