class MessagesController < ApplicationController
    def index
        unless session[:user]
            return redirect_to index_path
        end
        @user = session[:user]
        @messages = Message.select('messages.*', 'users.username').joins(:user)
        render 'wall'
    end

    def create
        @message = Message.new(message:params[:message])
        @message[:user_id] = session[:user]['id']
        if not @message.save
            flash[:errors] = @message.errors.full_messages
        end
        redirect_to wall_path        
    end
end
