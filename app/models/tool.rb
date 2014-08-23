class Tool < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_one :rental
  has_and_belongs_to_many :users, through: :rentals
end
