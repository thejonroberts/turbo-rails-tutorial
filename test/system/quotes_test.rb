require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    sign_in users(:accountant)
    @quote = quotes(:one) # Reference to the first fixture quote
  end

  test "Creating a new quote" do
    visit quotes_path

    assert_selector "h1", text: "Quotes"

    click_on "New quote"
    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_on @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path

    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path

    assert_text @quote.name

    accept_confirm do
      click_on "Delete", match: :first
    end

    assert_no_text @quote.name
  end

  # NOTE: from rails generator:
  # setup do
  #   @quote = quotes(:one)
  # end

  # test "visiting the index" do
  #   visit quotes_url
  #   assert_selector "h1", text: "Quotes"
  # end

  # test "should create quote" do
  #   visit quotes_url
  #   click_on "New quote"

  #   click_on "Create Quote"

  #   assert_text "Quote was successfully created"
  #   click_on "Back"
  # end

  # test "should update Quote" do
  #   visit quote_url(@quote)
  #   click_on "Edit this quote", match: :first

  #   click_on "Update Quote"

  #   assert_text "Quote was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Quote" do
  #   visit quote_url(@quote)
  #   click_on "Destroy this quote", match: :first

  #   assert_text "Quote was successfully destroyed"
  # end
end
