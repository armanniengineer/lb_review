class Youtuber < ApplicationRecord
	acts_as_votable
	searchkick
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :image, styles: { medium: "400x600#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
