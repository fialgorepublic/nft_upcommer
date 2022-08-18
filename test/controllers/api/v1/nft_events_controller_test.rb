require "test_helper"

class Api::V1::NftEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_nft_events_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_nft_events_create_url
    assert_response :success
  end
end
