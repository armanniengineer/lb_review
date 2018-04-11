class AddVideoIdToYoutubers < ActiveRecord::Migration[5.1]
  def change
    add_column :youtubers, :video_id, :string
  end
end
