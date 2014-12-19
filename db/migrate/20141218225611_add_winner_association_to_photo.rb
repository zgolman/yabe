class AddWinnerAssociationToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :winner_id, :integer
    add_index 'photos', ['winner_id'], :name => 'index_winner_id'
  end

  def self.down
    remove_column :photos, :winner_id
  end
end
