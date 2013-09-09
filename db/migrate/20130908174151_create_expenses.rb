class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.integer :expensetype_id
      t.decimal :expense_amount
      t.string :comment

      t.timestamps
    end
  end
end
