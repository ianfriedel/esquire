class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment was created succesfully"}
      else
        format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment has failed to post"}
      end
    end
  end

def comment_params
  params.require(:comment).permit(:author_name, :body)
end
end
