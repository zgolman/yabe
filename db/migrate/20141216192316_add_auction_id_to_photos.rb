class AddAuctionIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :auction_id, :integer
  end
end
