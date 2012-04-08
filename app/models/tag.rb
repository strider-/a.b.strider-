class Tag < ActiveRecord::Base
  attr_accessible :value, :article_id
  
  belongs_to :article
end
