class MusicsController < ApplicationController
    
    before_action only: [:show, :update]
    
    def index
        if params[:limit].present?
            limit = params[:limit]
        else
            limit = 10
        end
        if params[:offset].present?
            offset = params[:offset]
        else
            offset = 0
        end

        if params[:user_id].present?
            musics = User.find(params[:user_id]).musics.limit(limit).offset(offset)
        elsif params[:search].present?
            musics = Music.where(nil)
            musics = musics.filter_by_search_term(params[:search]).limit(limit).offset(offset)
        else
            musics = Music.limit(limit).offset(offset)
        end
        # require 'csv'
        # musics = CSV.read("Sheet Music Plus Music Links - Sheet1.csv")
        render json: musics, except: [:created_at, :updated_at]
    end

    def show
        render json: @music, except: [:created_at, :updated_at]
    end

    def update
        @usermusic = UserMusic.create(user_id: params[:user_id], music_id: params[:id], is_liked: true);

        render json: @usermusic, except: [:created_at, :updated_at]
    end

    def destroy
        @usermusic = UserMusic.where(user_id: params[:user_id], music_id: params[:id])
            @usermusic.destroy_all
                render json: {message: "Music Deleted from Saves"}
    end

    private

    def music_params
        params.require(:music).permit(:user, :music, :user_music)
    end
end