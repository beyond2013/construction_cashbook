require "application_system_test_case"

class ContractorsTest < ApplicationSystemTestCase
  setup do
    @contractor = contractors(:one)
  end

  test "visiting the index" do
    visit contractors_url
    assert_selector "h1", text: "Contractors"
  end

  test "should create contractor" do
    visit contractors_url
    click_on "New contractor"

    fill_in "Account", with: @contractor.account_id
    fill_in "Contractor type", with: @contractor.contractor_type
    fill_in "Email", with: @contractor.email
    fill_in "Name", with: @contractor.name
    fill_in "Phone", with: @contractor.phone
    fill_in "Specialization", with: @contractor.specialization
    click_on "Create Contractor"

    assert_text "Contractor was successfully created"
    click_on "Back"
  end

  test "should update Contractor" do
    visit contractor_url(@contractor)
    click_on "Edit this contractor", match: :first

    fill_in "Account", with: @contractor.account_id
    fill_in "Contractor type", with: @contractor.contractor_type
    fill_in "Email", with: @contractor.email
    fill_in "Name", with: @contractor.name
    fill_in "Phone", with: @contractor.phone
    fill_in "Specialization", with: @contractor.specialization
    click_on "Update Contractor"

    assert_text "Contractor was successfully updated"
    click_on "Back"
  end

  test "should destroy Contractor" do
    visit contractor_url(@contractor)
    click_on "Destroy this contractor", match: :first

    assert_text "Contractor was successfully destroyed"
  end
end
