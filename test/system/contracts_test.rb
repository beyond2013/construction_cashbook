require "application_system_test_case"

class ContractsTest < ApplicationSystemTestCase
  setup do
    @contract = contracts(:one)
  end

  test "visiting the index" do
    visit contracts_url
    assert_selector "h1", text: "Contracts"
  end

  test "should create contract" do
    visit contracts_url
    click_on "New contract"

    fill_in "Contractor", with: @contract.contractor_id
    fill_in "End date", with: @contract.end_date
    fill_in "Project", with: @contract.project_id
    fill_in "Start date", with: @contract.start_date
    fill_in "Status", with: @contract.status
    fill_in "Value", with: @contract.value
    click_on "Create Contract"

    assert_text "Contract was successfully created"
    click_on "Back"
  end

  test "should update Contract" do
    visit contract_url(@contract)
    click_on "Edit this contract", match: :first

    fill_in "Contractor", with: @contract.contractor_id
    fill_in "End date", with: @contract.end_date
    fill_in "Project", with: @contract.project_id
    fill_in "Start date", with: @contract.start_date
    fill_in "Status", with: @contract.status
    fill_in "Value", with: @contract.value
    click_on "Update Contract"

    assert_text "Contract was successfully updated"
    click_on "Back"
  end

  test "should destroy Contract" do
    visit contract_url(@contract)
    click_on "Destroy this contract", match: :first

    assert_text "Contract was successfully destroyed"
  end
end
