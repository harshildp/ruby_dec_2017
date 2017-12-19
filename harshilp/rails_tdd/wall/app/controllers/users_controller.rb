class UsersController < ApplicationController
    def index
    end
    def create
        u = User.find_by(username: params[:username])
        puts u
        if not u
            @user = User.new(username:params[:username])
            if @user.save
                session[:user] = @user
                redirect_to wall_path
            else
                flash[:errors] = @user.errors.full_messages
                redirect_to :back
            end
        else
            session[:user] = u
            redirect_to wall_path
        end
    end

    def logout
        session.delete(:user)
        redirect_to index_path
    end
end
