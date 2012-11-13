class Tagging < ActiveRecord::Base
  belongs_to :proverbe
  belongs_to :tag
end
