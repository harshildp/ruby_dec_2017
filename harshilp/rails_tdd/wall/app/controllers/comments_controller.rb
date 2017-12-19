class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment:params[:comment])
        @comment[:user_id] = session[:user]['id']
        @comment[:message_id] = params[:message_id]
        if not @comment.save
            flash[:comerrors] = @comment.errors.full_messages
        end
        redirect_to wall_path        
    end
end
