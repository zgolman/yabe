class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :stripeToken
      t.string :stripeTokenType
      t.string :stripeEmail

      t.timestamps
    end
  end
end

