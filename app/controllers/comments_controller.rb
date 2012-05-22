class CommentsController < ApplicationController

 def create
    @proverbe = Proverbe.find(params[:proverbe_id])
    comment_attr = params[:comment].merge :user_id => current_user.id
    @comment = @proverbe.comments.create(comment_attr)
    redirect_to proverbe_path(@proverbe)
  end
end
