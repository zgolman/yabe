class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|

	  t.string :amount
      t.string :auction_start
      t.string :auction_end
      t.string :auction_category

     

    end
  end
end
