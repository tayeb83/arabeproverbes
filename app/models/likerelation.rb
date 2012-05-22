class Likerelation < ActiveRecord::Base
  attr_accessible :user_id, :proverbe_id

  belongs_to :user, :class_name => "User"
  belongs_to :proverbe, :class_name => "Proverbe"

end
