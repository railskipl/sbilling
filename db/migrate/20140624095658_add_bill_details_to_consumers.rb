class AddBillDetailsToConsumers < ActiveRecord::Migration
  def change
    add_column :consumers, :transaction_id, :string
    add_column :consumers, :reciept_no, :string
    add_column :consumers, :paid_date, :datetime
    add_column :consumers, :paid_amt, :string
    add_column :consumers, :recieved_by, :string
  end
end
