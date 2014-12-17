class AddPhotosAssociationsToUser < ActiveRecord::Migration
   def self.up
    add_column :photos, :user_id, :integer
    add_index 'photos', ['user_id'], :name => 'index_user_photo_id'
  end

  def self.down
    remove_column :photos, :user_id
  end
end
