class AddAttachmentPathToPictures < ActiveRecord::Migration[5.1]
  def self.up
    change_table :pictures do |t|
      t.attachment :path
    end
  end

  def self.down
    remove_attachment :pictures, :path
  end
end
