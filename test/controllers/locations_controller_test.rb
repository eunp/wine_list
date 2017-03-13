require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:one)
  end

  test "should create location" do
    assert_difference('Location.count') do
      post store_locations_url(@location.store), params: { location: { position: 'My position' } }
    end

    assert_redirected_to store_url(@location.store)
  end

  test "should get edit" do
    get edit_store_location_url(@location.store, @location), xhr: true

    assert_select "form"
    assert_select "form input", 4
  end

  test "should update location" do
    patch store_location_url(@location.store, @location), params: { location: { position: 'New position' } }
    assert_redirected_to store_url(@location.store)
    @location.reload
    assert_equal "New position", @location.position
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete store_location_url(@location.store, @location)
    end

    assert_redirected_to store_url(@location.store)
  end
end
