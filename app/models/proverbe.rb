class Proverbe < ActiveRecord::Base
 
  attr_accessible :Corps, :tag_list, :proverbe_histoire, :proverbe_sens		
  validates :Corps, :presence => true
  validates :user_id, :presence=> true
  belongs_to :user
  acts_as_taggable_on :tags
  paginates_per 5

 

 has_many :liked, :through => :likerelations, :source => :user

 default_scope :order=> 'proverbes.created_at DESC'
 has_many :comments



end
