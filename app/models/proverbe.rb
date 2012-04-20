class Proverbe < ActiveRecord::Base
 attr_accessible :Corps
 validates :Corps, :presence => true
 validates :user_id, :presence=> true
 belongs_to :user

default_scope :order=> 'proverbes.created_at DESC'
end
