class AuthController < ApplicationController

    def index
        auth = Auth.all
    end

    def show
        render json: @auth
    end
    
    def create
        user = User.find_by(username: params[:username])
        if user && user.password === params[:password]
            payload = {user_id: user.id}
            render json: {user: user, success: "Welcome back, #{user.first_name}"}, except: [:password, :created_at, :updated_at]
        else
            render json: {failure: "Log in failed! Username or password invalid!"}, :status => 403
        end
    end

    def auto_login
        if session_user
            render json: session_user
        else
            render json: {errors: "No User Logged In"}
        end
    end

    def logged_in?
        !!session_user
    end
end