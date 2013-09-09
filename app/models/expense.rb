class Expense < ActiveRecord::Base
  attr_accessible :comment, :expense_amount, :expensetype_id, :user_id
end
