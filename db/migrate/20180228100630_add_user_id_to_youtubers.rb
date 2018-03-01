class AddUserIdToYoutubers < ActiveRecord::Migration[5.1]
  def change
    add_column :youtubers, :users_id, :integer
  end
end
