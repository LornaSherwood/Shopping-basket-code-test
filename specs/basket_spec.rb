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

end