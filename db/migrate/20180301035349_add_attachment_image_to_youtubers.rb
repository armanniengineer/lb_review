class AddAttachmentImageToYoutubers < ActiveRecord::Migration[5.0]
  def self.up
    change_table :youtubers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :youtubers, :image
  end
end
