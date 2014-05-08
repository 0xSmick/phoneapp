class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.datetime :date_of_transaction
      t.integer :user_id

      t.timestamps
    end
  end
end
