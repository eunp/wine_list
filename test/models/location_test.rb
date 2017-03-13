require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "store dependency" do
    l = locations(:one)
    assert_instance_of Store, l.store, "Location belongs to a store"
    assert_raises(NoMethodError) { l.stores }
  end

  test "wine dependency" do
    l = locations(:one)
    assert_instance_of Wine, l.wine, "Location has a wine"
    assert_raises(NoMethodError) { l.wines }

    assert l.destroy, "Deleting the location"
    wine = Wine.find(l.wine.id)
    assert_nil wine.location_id, "Location id has been nullify"
  end
end
