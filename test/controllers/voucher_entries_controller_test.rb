require "test_helper"

class VoucherEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voucher_entry = voucher_entries(:one)
  end

  test "should get index" do
    get voucher_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_voucher_entry_url
    assert_response :success
  end

  test "should create voucher_entry" do
    assert_difference("VoucherEntry.count") do
      post voucher_entries_url, params: { voucher_entry: { account_id: @voucher_entry.account_id, credit: @voucher_entry.credit, debit: @voucher_entry.debit, narration: @voucher_entry.narration, voucher_id: @voucher_entry.voucher_id } }
    end

    assert_redirected_to voucher_entry_url(VoucherEntry.last)
  end

  test "should show voucher_entry" do
    get voucher_entry_url(@voucher_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_voucher_entry_url(@voucher_entry)
    assert_response :success
  end

  test "should update voucher_entry" do
    patch voucher_entry_url(@voucher_entry), params: { voucher_entry: { account_id: @voucher_entry.account_id, credit: @voucher_entry.credit, debit: @voucher_entry.debit, narration: @voucher_entry.narration, voucher_id: @voucher_entry.voucher_id } }
    assert_redirected_to voucher_entry_url(@voucher_entry)
  end

  test "should destroy voucher_entry" do
    assert_difference("VoucherEntry.count", -1) do
      delete voucher_entry_url(@voucher_entry)
    end

    assert_redirected_to voucher_entries_url
  end
end
