class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w[admin moderator member banned]

  belongs_to :group

  has_many :tools

  has_many :rentals
  has_many :tools, through: :rentals

end
