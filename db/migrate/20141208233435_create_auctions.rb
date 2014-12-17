class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :amount
      t.integer :auction_period
      t.string :category

      t.timestamps
    end
  end
end
