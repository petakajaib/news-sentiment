require "application_system_test_case"

class SentimentsTest < ApplicationSystemTestCase
  setup do
    @sentiment = sentiments(:one)
  end

  test "visiting the index" do
    visit sentiments_url
    assert_selector "h1", text: "Sentiments"
  end

  test "creating a Sentiment" do
    visit sentiments_url
    click_on "New Sentiment"

    fill_in "Negative", with: @sentiment.negative
    fill_in "Positive", with: @sentiment.positive
    click_on "Create Sentiment"

    assert_text "Sentiment was successfully created"
    click_on "Back"
  end

  test "updating a Sentiment" do
    visit sentiments_url
    click_on "Edit", match: :first

    fill_in "Negative", with: @sentiment.negative
    fill_in "Positive", with: @sentiment.positive
    click_on "Update Sentiment"

    assert_text "Sentiment was successfully updated"
    click_on "Back"
  end

  test "destroying a Sentiment" do
    visit sentiments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sentiment was successfully destroyed"
  end
end
