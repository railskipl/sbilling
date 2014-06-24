class ConsumersController < ApplicationController
  # GET /consumers
  # GET /consumers.json
  def index 
    @consumers = Consumer.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consumers }
    end
  end
  # method for consumer check
  # GET /consumer_check
  # GET /consumer_check.json
   def consumer_check 
    @consumers_values = []
    @consumers = Consumer.find_by_consumer_no(params[:consumer_no])
    @consumers_values[0] = @consumers.id
    @consumers_values[1] = @consumers.consumer_no
    @consumers_values[2] = @consumers.consumer_name
    @consumers_values[3] = @consumers.bill_month
    @consumers_values[4] = @consumers.due_date
    @consumers_values[5] = @consumers.arrear
    @consumers_values[6] = @consumers.last_bill_amount
    @consumers_values[7] = @consumers.last_paid_date
    @consumers_values[8] = @consumers.current_dues
    @consumers_values[9] = @consumers.net_bill_amt    

    render :status =>200,:json => @consumers_values.to_json
    
  end
  # method for generating bill.
  # GET /consumer_bill
  # GET /consumer_bill.json
   def consumer_bill 
    @consumers = Consumer.find_by_consumer_no(params[:consumer_no])
    trans_id = rand(8 ** 8).to_s
    b = 'PMGW'
    c = b + trans_id
    reciept_no = rand(6 ** 6).to_s

    @consumers_bill = @consumers.update_attributes(:transaction_id => c ,:reciept_no => reciept_no ,:consumer_no => @consumers.consumer_no,:paid_amt =>params[:paid_amt],:recieved_by =>params[:user_name],:paid_date => DateTime.now )
    @consumers_bill_details = Consumer.find_by_consumer_no(params[:consumer_no])
    @consumers_bill_values = []
    @consumers_bill_values[0] = @consumers_bill_details.id
    @consumers_bill_values[1] = @consumers_bill_details.transaction_id
    @consumers_bill_values[2] = @consumers_bill_details.reciept_no
    @consumers_bill_values[3] = @consumers_bill_details.consumer_no
    @consumers_bill_values[4] = @consumers_bill_details.paid_date
    @consumers_bill_values[5] = @consumers_bill_details.paid_amt
    @consumers_bill_values[6] = @consumers_bill_details.recieved_by

    render :status =>200,:json => @consumers_bill_values.to_json
    
  end

  # GET /consumers/1
  # GET /consumers/1.json
  def show
    @consumer = Consumer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consumer }
    end
  end

  # GET /consumers/new
  # GET /consumers/new.json
  def new
    @consumer = Consumer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consumer }
    end
  end

  # GET /consumers/1/edit
  def edit
    @consumer = Consumer.find(params[:id])
  end

  # POST /consumers
  # POST /consumers.json
  def create
    @consumer = Consumer.new(params[:consumer])

    respond_to do |format|
      if @consumer.save
        format.html { redirect_to @consumer, notice: 'Consumer was successfully created.' }
        format.json { render json: @consumer, status: :created, location: @consumer }
      else
        format.html { render action: "new" }
        format.json { render json: @consumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /consumers/1
  # PUT /consumers/1.json
  def update
    @consumer = Consumer.find(params[:id])

    respond_to do |format|
      if @consumer.update_attributes(params[:consumer])
        format.html { redirect_to @consumer, notice: 'Consumer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @consumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumers/1
  # DELETE /consumers/1.json
  def destroy
    @consumer = Consumer.find(params[:id])
    @consumer.destroy

    respond_to do |format|
      format.html { redirect_to consumers_url }
      format.json { head :no_content }
    end
  end
end
