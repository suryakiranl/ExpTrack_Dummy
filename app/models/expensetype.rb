class Expensetype < ActiveRecord::Base
  attr_accessible :name, :description

  # State that this is a parent table for 'expenses'
  has_many :expenses

  # Basic validations for fields
  validates :name, :presence => true, :length => { :maximum => 50 }
  validates :description, :length => { :maximum => 150 }
end
