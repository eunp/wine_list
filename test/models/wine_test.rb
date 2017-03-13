require 'test_helper'

class WineTest < ActiveSupport::TestCase
  test "save empty wine record" do
    w = Wine.new
    assert_not w.save, "Saved empty wine entry"
  end

  test "required fields exist" do
    w = Wine.create(name: 'wine1', year: 2000)
    assert_not w.save, "Missing price"

    w = Wine.create(name: 'wine1', price: 1)
    assert_not w.save, "Missing year"

    w = Wine.create(year: 2000, price: 1)
    assert_not w.save, "Missing name"

    w = Wine.create(name: 'wine1', year: 2000, price: 2)
    assert w.save, "Name, year, and price all specified"
  end

  test "ensure vineyard inherits name" do
    w = Wine.create(name: 'wine1', year: 2000, price: 2)
    assert w.valid?, "Problems saving wine entry"
    assert_equal(w.name, w.vineyard)
  end

  test "year is valid" do
    w = Wine.create(name: 'wine1', year: 'abcd', price: 1)
    assert_not w.save, "Saved a string for year"

    w = Wine.create(name: 'wine1', year: 201, price: 1)
    assert_not w.save, "Saved an invalid year"

    w = Wine.create(name: 'wine1', year: 20001, price: 1)
    assert_not w.save, "Saved an invalid year"

    w = Wine.create(name: 'wine1', year: 2001, price: 1)
    assert w.save, "Saved a valid year"
  end

  test "price is a number" do
    w = Wine.create(name: 'wine1', year: 2001, price: 'abc')
    assert_not w.save, "Saved price as a string"

    w = Wine.create(name: 'wine1', year: 2001, price: 1.1)
    assert w.save, "Saved price as a float"

    w = Wine.create(name: 'wine1', year: 2001, price: 10)
    assert w.save, "Saved price as a number"
  end

  test "location dependency" do
    w1 = wines(:one)
    assert_instance_of Location, w1.location, "Wine belongs to a location"
    assert_raises(NoMethodError) { w1.locations }
  end

  test "store dependency" do
    w2 = wines(:two)
    assert_instance_of Store, w2.store, "Wine belongs to a store"
    assert_raises(NoMethodError) { w2.stores }
  end
end
