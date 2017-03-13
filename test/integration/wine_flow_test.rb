require 'test_helper'

class WineFlowTest < ActionDispatch::IntegrationTest
  test "see the welcome page" do
    get "/"
    assert_select "h1", "Welcome"
  end

  test "create wine entry" do
    get "/wines/new"
    assert_response :success

    post "/wines",
      params: { wine: { name: 'My wine', year: 2000, price: 10 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Name:\n  My wine"
  end
end
