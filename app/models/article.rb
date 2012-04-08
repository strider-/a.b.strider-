class Article < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :tags
  after_destroy :cleanup
  
  belongs_to :user
  has_many :tags
  accepts_nested_attributes_for :tags

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

  def modified?
    created_at != updated_at
  end

  private
    def cleanup
      if self.destroyed?
        self.tags.destroy_all
      end
    end
end
