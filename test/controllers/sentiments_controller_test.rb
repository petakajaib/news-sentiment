require 'test_helper'

class SentimentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sentiment = sentiments(:one)
  end

  test "should get index" do
    get sentiments_url
    assert_response :success
  end

  test "should get new" do
    get new_sentiment_url
    assert_response :success
  end

  test "should create sentiment" do
    assert_difference('Sentiment.count') do
      post sentiments_url, params: { sentiment: { negative: @sentiment.negative, positive: @sentiment.positive } }
    end

    assert_redirected_to sentiment_url(Sentiment.last)
  end

  test "should show sentiment" do
    get sentiment_url(@sentiment)
    assert_response :success
  end

  test "should get edit" do
    get edit_sentiment_url(@sentiment)
    assert_response :success
  end

  test "should update sentiment" do
    patch sentiment_url(@sentiment), params: { sentiment: { negative: @sentiment.negative, positive: @sentiment.positive } }
    assert_redirected_to sentiment_url(@sentiment)
  end

  test "should destroy sentiment" do
    assert_difference('Sentiment.count', -1) do
      delete sentiment_url(@sentiment)
    end

    assert_redirected_to sentiments_url
  end
end
