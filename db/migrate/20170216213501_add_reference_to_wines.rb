class AddReferenceToWines < ActiveRecord::Migration[5.0]
  def change
    add_reference :wines, :location, foreign_key: true
  end
end
