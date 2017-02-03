require 'minitest/autorun'
require 'minitest/rg'

require_relative '../basket.rb'
require_relative '../item.rb'

class TestBasket < Minitest::Test
  def setup
    @basket = Basket.new()
    @item = Item.new("Trainers", 69.99)
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

  

end