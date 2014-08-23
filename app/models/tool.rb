class Tool < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_one :rental
  has_one :user, through: :rental

  # include Workflow

  # workflow do

  #   state :available do
  #     event :check_out, transitions_to: :checked_out
  #     event :reserve, transitions_to: :reserved
  #   end

  #   state :checked_out do
  #     event :return, transitions_to: :available
  #   end

  #   state :reserved do
  #     event :examine, transitions_to: :checkup
  #     event :operate, transitions_to: :surgery
  #     event :pay, transitions_to: :billing
  #   end

  #  

  # end
end
