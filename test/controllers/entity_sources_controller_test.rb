require 'test_helper'

class EntitySourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entity_source = entity_sources(:one)
  end

  test "should get index" do
    get entity_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_entity_source_url
    assert_response :success
  end

  test "should create entity_source" do
    assert_difference('EntitySource.count') do
      post entity_sources_url, params: { entity_source: { entity_id: @entity_source.entity_id, source_id: @entity_source.source_id } }
    end

    assert_redirected_to entity_source_url(EntitySource.last)
  end

  test "should show entity_source" do
    get entity_source_url(@entity_source)
    assert_response :success
  end

  test "should get edit" do
    get edit_entity_source_url(@entity_source)
    assert_response :success
  end

  test "should update entity_source" do
    patch entity_source_url(@entity_source), params: { entity_source: { entity_id: @entity_source.entity_id, source_id: @entity_source.source_id } }
    assert_redirected_to entity_source_url(@entity_source)
  end

  test "should destroy entity_source" do
    assert_difference('EntitySource.count', -1) do
      delete entity_source_url(@entity_source)
    end

    assert_redirected_to entity_sources_url
  end
end
