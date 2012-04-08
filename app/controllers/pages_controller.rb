class PagesController < ApplicationController
  def home
  @title = "الرئيسية"
  end

  def contact
  @title = "اتصل بنا"
  end

  def terms
  @title = ""
  end

  def help
  @title = "مساعدة"	
  end

  def about
 @title = "عنا"
  end

  def privacy
  end
end
