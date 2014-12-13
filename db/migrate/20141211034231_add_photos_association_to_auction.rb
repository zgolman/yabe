class AddPhotosAssociationToAuction < ActiveRecord::Migration
  def self.up
    add_column :photos, :auction_id, :integer
    add_index 'photos', ['auction_id'], :name => 'index_auction_id'
  end

  def self.down
    remove_column :photos, :auction_id
  end
end



