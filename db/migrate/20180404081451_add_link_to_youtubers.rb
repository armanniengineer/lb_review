class AddLinkToYoutubers < ActiveRecord::Migration[5.1]
  def change
    add_column :youtubers, :link, :string
  end
end
