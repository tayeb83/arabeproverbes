# encoding: UTF-8
class PagesController < ApplicationController
  def home
  @title = "الرئيسية"
  if signed_in?
  @proverbe = current_user.proverbes.build 
  @feed_items = current_user.feed.paginate(:page=> params[:page])
  end
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
