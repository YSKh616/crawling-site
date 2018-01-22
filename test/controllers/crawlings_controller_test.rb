require 'test_helper'

class CrawlingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crawling = crawlings(:one)
  end

  test "should get index" do
    get crawlings_url
    assert_response :success
  end

  test "should get new" do
    get new_crawling_url
    assert_response :success
  end

  test "should create crawling" do
    assert_difference('Crawling.count') do
      post crawlings_url, params: { crawling: {  } }
    end

    assert_redirected_to crawling_url(Crawling.last)
  end

  test "should show crawling" do
    get crawling_url(@crawling)
    assert_response :success
  end

  test "should get edit" do
    get edit_crawling_url(@crawling)
    assert_response :success
  end

  test "should update crawling" do
    patch crawling_url(@crawling), params: { crawling: {  } }
    assert_redirected_to crawling_url(@crawling)
  end

  test "should destroy crawling" do
    assert_difference('Crawling.count', -1) do
      delete crawling_url(@crawling)
    end

    assert_redirected_to crawlings_url
  end
end
