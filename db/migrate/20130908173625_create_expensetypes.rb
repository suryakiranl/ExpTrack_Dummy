class CreateExpensetypes < ActiveRecord::Migration
  def change
    create_table :expensetypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
