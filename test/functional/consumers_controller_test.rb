require 'test_helper'

class ConsumersControllerTest < ActionController::TestCase
  setup do
    @consumer = consumers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consumers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consumer" do
    assert_difference('Consumer.count') do
      post :create, consumer: { arrear: @consumer.arrear, bill_month: @consumer.bill_month, consumer_name: @consumer.consumer_name, consumer_no: @consumer.consumer_no, current_dues: @consumer.current_dues, due_date: @consumer.due_date, last_bill_amount: @consumer.last_bill_amount, last_paid_date: @consumer.last_paid_date, net_bill_amt: @consumer.net_bill_amt }
    end

    assert_redirected_to consumer_path(assigns(:consumer))
  end

  test "should show consumer" do
    get :show, id: @consumer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consumer
    assert_response :success
  end

  test "should update consumer" do
    put :update, id: @consumer, consumer: { arrear: @consumer.arrear, bill_month: @consumer.bill_month, consumer_name: @consumer.consumer_name, consumer_no: @consumer.consumer_no, current_dues: @consumer.current_dues, due_date: @consumer.due_date, last_bill_amount: @consumer.last_bill_amount, last_paid_date: @consumer.last_paid_date, net_bill_amt: @consumer.net_bill_amt }
    assert_redirected_to consumer_path(assigns(:consumer))
  end

  test "should destroy consumer" do
    assert_difference('Consumer.count', -1) do
      delete :destroy, id: @consumer
    end

    assert_redirected_to consumers_path
  end
end
