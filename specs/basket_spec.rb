require 'minitest/autorun'
require 'minitest/rg'

require_relative '../basket.rb'
require_relative '../item.rb'
require_relative '../customer.rb'

class TestBasket < Minitest::Test
  def setup
    @customer = Customer.new("Mo", true)
    @customer2 = Customer.new("Jessica", false)
    @basket = Basket.new(@customer)
    @basket2 = Basket.new(@customer2)
    @item = Item.new("Trainers", 69.99)
    @item2 = Item.new("Shorts", 34.99)
    @item3 = Item.new("T-shirt", 12.99)
  end

  def test_basket_starts_empty
    assert_equal(0, @basket.count_items())
  end

  def test_can_add_item_to_basket
    @basket.add_item(@item)
    assert_equal(1, @basket.count_items())
  end

  def test_can_remove_item_from_basket
    @basket.add_item(@item)
    @basket.remove_item(@item)
    assert_equal(0, @basket.count_items())
  end

  def test_can_empty_basket
    @basket.add_item(@item)
    @basket.empty
    assert_equal(0, @basket.count_items())
  end

  def test_cost_of_empty_basket_is_zero
    assert_equal(0, @basket.total_cost())
  end

  def test_adding_item_increases_total_cost
    @basket.add_item(@item)
    assert_equal(69.99, @basket.total_cost())
  end

  def test_adding_multiple_items_total_cost
    @basket.add_item(@item)
    @basket.add_item(@item2)
    assert_equal(104.98, @basket.total_cost())
  end

  def test_removing_item_returns_total_cost_to_zero
    @basket.add_item(@item)
    @basket.total_cost()
    @basket.remove_item(@item)
    assert_equal(0, @basket.total_cost())
  end

end