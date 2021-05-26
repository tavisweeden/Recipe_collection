class AddAmountToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :amount, :string
  end
end
