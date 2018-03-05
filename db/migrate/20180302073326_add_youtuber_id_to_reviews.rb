class AddYoutuberIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :youtuber_id, :integer
  end
end
