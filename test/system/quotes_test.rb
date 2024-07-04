require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one) # Reference to the first fixture quote
  end

  test "Creating a new quote" do
    # When we visit the Quotes#index page
    # we expect to see a title with the text "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # When we click on the link with the text "New quote"
    # we expect to land on a page with the title "New quote"
    click_on "New quote"
    assert_selector "h1", text: "New quote"

    # When we fill in the name input with "Capybara quote"
    # and we click on "Create Quote"
    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    # We expect to be back on the page with the title "Quotes"
    # and to see our "Capybara quote" added to the list
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
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
