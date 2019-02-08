require "application_system_test_case"

class EntitySourcesTest < ApplicationSystemTestCase
  setup do
    @entity_source = entity_sources(:one)
  end

  test "visiting the index" do
    visit entity_sources_url
    assert_selector "h1", text: "Entity Sources"
  end

  test "creating a Entity source" do
    visit entity_sources_url
    click_on "New Entity Source"

    fill_in "Entity", with: @entity_source.entity_id
    fill_in "Source", with: @entity_source.source_id
    click_on "Create Entity source"

    assert_text "Entity source was successfully created"
    click_on "Back"
  end

  test "updating a Entity source" do
    visit entity_sources_url
    click_on "Edit", match: :first

    fill_in "Entity", with: @entity_source.entity_id
    fill_in "Source", with: @entity_source.source_id
    click_on "Update Entity source"

    assert_text "Entity source was successfully updated"
    click_on "Back"
  end

  test "destroying a Entity source" do
    visit entity_sources_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entity source was successfully destroyed"
  end
end
