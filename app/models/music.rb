class Music < ApplicationRecord
    has_many :user_musics
    has_many :users, through: :user_musics

    scope :filter_by_search_term, -> (search_term) { where("instrument like ? OR piece like ? OR composer like ? OR arranger like ? OR publisher like ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")}
end