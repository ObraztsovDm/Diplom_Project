require "application_system_test_case"

class ActivesTest < ApplicationSystemTestCase
  setup do
    @active = actives(:one)
  end

  test "visiting the index" do
    visit actives_url
    assert_selector "h1", text: "Actives"
  end

  test "should create active" do
    visit actives_url
    click_on "New active"

    fill_in "End", with: @active.end
    fill_in "Guess claster", with: @active.guess_claster
    fill_in "Number bots", with: @active.number_bots
    fill_in "Start", with: @active.start
    click_on "Create Active"

    assert_text "Active was successfully created"
    click_on "Back"
  end

  test "should update Active" do
    visit active_url(@active)
    click_on "Edit this active", match: :first

    fill_in "End", with: @active.end
    fill_in "Guess claster", with: @active.guess_claster
    fill_in "Number bots", with: @active.number_bots
    fill_in "Start", with: @active.start
    click_on "Update Active"

    assert_text "Active was successfully updated"
    click_on "Back"
  end

  test "should destroy Active" do
    visit active_url(@active)
    click_on "Destroy this active", match: :first

    assert_text "Active was successfully destroyed"
  end
end
