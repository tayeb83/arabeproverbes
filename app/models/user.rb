class User < ActiveRecord::Base
  has_many :proverbes , :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy  
 
  has_many :following, :through => :relationships, :source => :followed


  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

 
  has_many :likerelations, :dependent => :destroy 

  has_many :likeproverbes, :through =>:likerelations, :source => :id_proverbe

  attr_accessible :name, :email, :password, :password_confirmation
  before_save :encrypt_password, :create_remember_token
  
  has_many :comments, :dependent => :destroy


	
  attr_accessor :password
 attr_accessor :remember_token
  
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of	:name, :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def like!(id_proverbe)
  likerelations.create!(:id_proverbe => id_proverbe)
  end 
  
  def unlike!(id_proverbe)
  likerelations.find_by_id_proverbe(id_proverbe).destroy
  end 


  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

  def feed
    Proverbe.where("user_id = ?", id)
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end



 def create_remember_token
      self.remember_token = SecureRandom.hex
    end
end
