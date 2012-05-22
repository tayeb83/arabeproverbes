class Proverbe < ActiveRecord::Base
 attr_accessible :Corps
 validates :Corps, :presence => true
 validates :user_id, :presence=> true
 belongs_to :user
 has_many :likerelations, :foreign_key => "user_id",
                           :dependent => :destroy  
 

 has_many :liked, :through => :likerelations, :source => :user

default_scope :order=> 'proverbes.created_at DESC'
has_many :comments



end
