require "application_system_test_case"

class VouchersTest < ApplicationSystemTestCase
  setup do
    @voucher = vouchers(:one)
  end

  test "visiting the index" do
    visit vouchers_url
    assert_selector "h1", text: "Vouchers"
  end

  test "should create voucher" do
    visit vouchers_url
    click_on "New voucher"

    fill_in "Date", with: @voucher.date
    fill_in "Description", with: @voucher.description
    fill_in "Project", with: @voucher.project_id
    fill_in "Voucher number", with: @voucher.voucher_number
    fill_in "Voucher type", with: @voucher.voucher_type
    click_on "Create Voucher"

    assert_text "Voucher was successfully created"
    click_on "Back"
  end

  test "should update Voucher" do
    visit voucher_url(@voucher)
    click_on "Edit this voucher", match: :first

    fill_in "Date", with: @voucher.date
    fill_in "Description", with: @voucher.description
    fill_in "Project", with: @voucher.project_id
    fill_in "Voucher number", with: @voucher.voucher_number
    fill_in "Voucher type", with: @voucher.voucher_type
    click_on "Update Voucher"

    assert_text "Voucher was successfully updated"
    click_on "Back"
  end

  test "should destroy Voucher" do
    visit voucher_url(@voucher)
    click_on "Destroy this voucher", match: :first

    assert_text "Voucher was successfully destroyed"
  end
end
