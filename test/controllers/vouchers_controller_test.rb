require "test_helper"

class VouchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voucher = vouchers(:one)
  end

  test "should get index" do
    get vouchers_url
    assert_response :success
  end

  test "should get new" do
    get new_voucher_url
    assert_response :success
  end

  test "should create voucher" do
    assert_difference("Voucher.count") do
      post vouchers_url, params: { voucher: { date: @voucher.date, description: @voucher.description, project_id: @voucher.project_id, voucher_number: @voucher.voucher_number, voucher_type: @voucher.voucher_type } }
    end

    assert_redirected_to voucher_url(Voucher.last)
  end

  test "should show voucher" do
    get voucher_url(@voucher)
    assert_response :success
  end

  test "should get edit" do
    get edit_voucher_url(@voucher)
    assert_response :success
  end

  test "should update voucher" do
    patch voucher_url(@voucher), params: { voucher: { date: @voucher.date, description: @voucher.description, project_id: @voucher.project_id, voucher_number: @voucher.voucher_number, voucher_type: @voucher.voucher_type } }
    assert_redirected_to voucher_url(@voucher)
  end

  test "should destroy voucher" do
    assert_difference("Voucher.count", -1) do
      delete voucher_url(@voucher)
    end

    assert_redirected_to vouchers_url
  end
end
