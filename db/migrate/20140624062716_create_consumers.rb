class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :consumer_no
      t.string :consumer_name
      t.string :bill_month
      t.date :due_date
      t.float :arrear
      t.string :last_bill_amount
      t.date :last_paid_date
      t.integer :current_dues
      t.integer :net_bill_amt

      t.timestamps
    end
  end
end
