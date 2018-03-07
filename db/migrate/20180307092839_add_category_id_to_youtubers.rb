class AddCategoryIdToYoutubers < ActiveRecord::Migration[5.1]
  def change
    add_column :youtubers, :category_id, :integer
  end
end
