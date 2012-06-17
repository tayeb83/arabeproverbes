class AddRootAdminUsers < ActiveRecord::Migration
  def up
  adminuser = AdminUser.create!(:username => 'root', :email => 'daade@gmail.com', :password => 'rootroot', :password_confirmation => 'rootroot')
  end

  def down  
   adminuser = AdminUser.find_by_username( 'root' )
   adminuser.destroy	
  end
end
