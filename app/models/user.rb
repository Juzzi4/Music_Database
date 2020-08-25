class User < ApplicationRecord
    has_many :user_musics
    has_many :musics, through: :user_musics
end