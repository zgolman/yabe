class AddAuctionsAssociationToUser < ActiveRecord::Migration
  def self.up
    add_column :auctions, :user_id, :integer
    add_index 'auctions', ['user_id'], :name => 'index_user_id'
  end

  def self.down
    remove_column :auctions, :user_id
  end
end


