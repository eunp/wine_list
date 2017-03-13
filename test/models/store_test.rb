require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  test "save empty store entry" do
    s = Store.new
    assert_not s.save, "Saved an empty store entry"
  end

  test "save duplicate name" do
    s1 = Store.create(name: 'store1')
    assert s1.save, "Saving valid store"
    s2 = Store.create(name: 'store1')
    assert_not s2.save, "Saving duplicate store name"
  end

  test "locations dependency" do
    s = stores(:one)
    assert_instance_of Location, s.locations.first, "Store has locations"
    assert_raises(NoMethodError) { s.location }
  end

  test "wines dependency" do
    s = stores(:one)
    assert_instance_of Wine, s.wines.first, "Store has wines"
    assert_raises(NoMethodError) { s.wine }
  end

  test "locations are destroyed" do
    s = stores(:one)
    assert s.destroy, "Deleting the store"
    locations = Location.find_by_store_id(s.id)
    assert_nil locations, "Locations destroyed from deleting store"
  end
end
