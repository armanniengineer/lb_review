class Youtuber < ApplicationRecord
	acts_as_votable
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :image, styles: { medium: "400x600#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	def youtube_embed
	  if link[/youtu\.be\/([^\?]*)/]
	    video_id = $1
	  else

	    link[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	    video_id = $5
	  end
	end
end
