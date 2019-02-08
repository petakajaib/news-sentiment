require "application_system_test_case"

class EntitySentencesTest < ApplicationSystemTestCase
  setup do
    @entity_sentence = entity_sentences(:one)
  end

  test "visiting the index" do
    visit entity_sentences_url
    assert_selector "h1", text: "Entity Sentences"
  end

  test "creating a Entity sentence" do
    visit entity_sentences_url
    click_on "New Entity Sentence"

    fill_in "Entity", with: @entity_sentence.entity_id
    fill_in "Source", with: @entity_sentence.source_id
    click_on "Create Entity sentence"

    assert_text "Entity sentence was successfully created"
    click_on "Back"
  end

  test "updating a Entity sentence" do
    visit entity_sentences_url
    click_on "Edit", match: :first

    fill_in "Entity", with: @entity_sentence.entity_id
    fill_in "Source", with: @entity_sentence.source_id
    click_on "Update Entity sentence"

    assert_text "Entity sentence was successfully updated"
    click_on "Back"
  end

  test "destroying a Entity sentence" do
    visit entity_sentences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entity sentence was successfully destroyed"
  end
end
