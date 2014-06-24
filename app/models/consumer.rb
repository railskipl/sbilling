class Consumer < ActiveRecord::Base
  attr_accessible :arrear, :bill_month, :consumer_name, :consumer_no, :current_dues, :due_date, :last_bill_amount, :last_paid_date, :net_bill_amt,:transaction_id, :reciept_no, :paid_amt, :recieved_by,:paid_date
end
