class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, except: [:created_at, :updated_at]
    end

    def show
        render json: @users
    end

    def create
        user = User.create(user_params)
        if user.valid?
            payload = {user_id: user.id}
            render json: {user: user}
        else
            render json: {errors: user.errors.full_messages}, status: :not_acceptable
        end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :username, :password, :instrument)
    end
end