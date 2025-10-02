require "application_system_test_case"

class VoucherEntriesTest < ApplicationSystemTestCase
  setup do
    @voucher_entry = voucher_entries(:one)
  end

  test "visiting the index" do
    visit voucher_entries_url
    assert_selector "h1", text: "Voucher entries"
  end

  test "should create voucher entry" do
    visit voucher_entries_url
    click_on "New voucher entry"

    fill_in "Account", with: @voucher_entry.account_id
    fill_in "Credit", with: @voucher_entry.credit
    fill_in "Debit", with: @voucher_entry.debit
    fill_in "Narration", with: @voucher_entry.narration
    fill_in "Voucher", with: @voucher_entry.voucher_id
    click_on "Create Voucher entry"

    assert_text "Voucher entry was successfully created"
    click_on "Back"
  end

  test "should update Voucher entry" do
    visit voucher_entry_url(@voucher_entry)
    click_on "Edit this voucher entry", match: :first

    fill_in "Account", with: @voucher_entry.account_id
    fill_in "Credit", with: @voucher_entry.credit
    fill_in "Debit", with: @voucher_entry.debit
    fill_in "Narration", with: @voucher_entry.narration
    fill_in "Voucher", with: @voucher_entry.voucher_id
    click_on "Update Voucher entry"

    assert_text "Voucher entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Voucher entry" do
    visit voucher_entry_url(@voucher_entry)
    click_on "Destroy this voucher entry", match: :first

    assert_text "Voucher entry was successfully destroyed"
  end
end
