class AddDescriptionToExpensetypes < ActiveRecord::Migration
  def change
    add_column :expensetypes, :description, :string
  end
end
