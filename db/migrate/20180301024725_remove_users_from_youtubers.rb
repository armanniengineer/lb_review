class RemoveUsersFromYoutubers < ActiveRecord::Migration[5.1]
  def change
    remove_column :youtubers, :users_id, :integer
  end
end
