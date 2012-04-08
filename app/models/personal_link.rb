class PersonalLink < ActiveRecord::Base
  attr_accessible :title, :link, :code

  validates :code, presence: true, length: { maximum: 3 }
  validates :title, presence: true
  validates :link, presence: true
end
