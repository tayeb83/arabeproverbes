namespace :db do
  desc "Fill database with sample data"
  task :populate=> :environment do
	admin = User.create!(:name=> "Example User",
                         :email=> "example@railstutorial.org",
                         :password=> "bosser",
                         :password_confirmation=> "bosser")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name=> name,
                   :email=> email,																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																									
                   :password=> password,
                   :password_confirmation=> password)
    end
 																	
   users = User.all(:limit=> 6)
    50.times do
      content = Faker::Lorem.sentence(3)
      users.each { |user| user.proverbes.create!(:Corps=> content) }
    end
  end
 def make_relationships
  users = User.all
  user  = users.first
  following = users[1..50]
  followers = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end 
end

