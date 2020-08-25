class UserMusicsController < ApplicationController

    before_action only: [:destroy]

    def index
        usermusics = UserMusic.all
        render json: usermusics, except: [:created_at, :updated_at]
    end

    def show
        render json: @usermusic, except: [:created_at, :updated_at]
    end

    # def destroy
    #     @usermusic = UserMusic.find(params[:id])
    #         @usermusic.destroy
    #             render json: {message: "Music Deleted from Saves"}
    # end
end