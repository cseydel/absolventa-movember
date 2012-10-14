class AddAttachmentAvatarToBros < ActiveRecord::Migration
  def self.up
    change_table :bros do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :bros, :avatar
  end
end
