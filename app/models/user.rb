class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :nickname, :email, :birthday, :bio,
                  :password, :password_confirmation

  has_secure_password
  has_many :articles

  VALID_EMAL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :nickname, presence: true, length: { maximum: 25 }
  validates :email, presence: true,
                    format: { with: VALID_EMAL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, on: :create
  validates :password_confirmation, presence: true, on: :create           

  def age
    (Date.today - birthday).to_i / 365
  end         
end
