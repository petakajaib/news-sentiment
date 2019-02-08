require 'test_helper'

class EntitySentencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entity_sentence = entity_sentences(:one)
  end

  test "should get index" do
    get entity_sentences_url
    assert_response :success
  end

  test "should get new" do
    get new_entity_sentence_url
    assert_response :success
  end

  test "should create entity_sentence" do
    assert_difference('EntitySentence.count') do
      post entity_sentences_url, params: { entity_sentence: { entity_id: @entity_sentence.entity_id, source_id: @entity_sentence.source_id } }
    end

    assert_redirected_to entity_sentence_url(EntitySentence.last)
  end

  test "should show entity_sentence" do
    get entity_sentence_url(@entity_sentence)
    assert_response :success
  end

  test "should get edit" do
    get edit_entity_sentence_url(@entity_sentence)
    assert_response :success
  end

  test "should update entity_sentence" do
    patch entity_sentence_url(@entity_sentence), params: { entity_sentence: { entity_id: @entity_sentence.entity_id, source_id: @entity_sentence.source_id } }
    assert_redirected_to entity_sentence_url(@entity_sentence)
  end

  test "should destroy entity_sentence" do
    assert_difference('EntitySentence.count', -1) do
      delete entity_sentence_url(@entity_sentence)
    end

    assert_redirected_to entity_sentences_url
  end
end
