class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
		#define the attributes (columns), and give them a type, in this case string 
		t.string :amount
      	t.string :auction_period
      	t.integer :cateogry
      	t.integer :user_id


        t.timestamps
    end
  end
end

