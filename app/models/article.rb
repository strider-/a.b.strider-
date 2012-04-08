class Article < ActiveRecord::Base
  attr_accessible :title, :content, :user_id
  
  belongs_to :user
  has_many :tags

  def modified?
    created_at != updated_at
  end
end
