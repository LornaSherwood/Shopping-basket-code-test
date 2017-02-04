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

  def test_Bogof_reduces_cost
    @basket.add_item(@item)
    @basket.add_item(@item2)
    apply_discount = @basket.bogof_total_cost
    assert_equal(69.99, apply_discount)
  end

  def test_Bogof_correct_3_items
    @basket.add_item(@item)
    @basket.add_item(@item2)
    @basket.add_item(@item3)
    apply_discount = @basket.bogof_total_cost
    assert_equal(82.98, apply_discount)
  end

  def test_percent_deduction_reduces_cost
    @basket.add_item(@item)
    @basket.add_item(@item2)
    apply_discount = @basket.percent_discount(10, 20.0)
    assert_equal(62.99, apply_discount)
  end

  def test_percent_deduction_applies_above_value
    @basket.add_item(@item)
    @basket.add_item(@item2)
    apply_discount = @basket.percent_discount(10, 20.0)
    assert_equal(62.99, apply_discount)
  end

  def test_percent_deduction_not_applied_below_value
    @basket.add_item(@item3)
    apply_discount = @basket.percent_discount(10, 20.0)
    assert_equal(12.99, apply_discount)
  end

  def test_loyalty_discount_reduces_total_with_card
    @basket.add_item(@item)
    @basket.add_item(@item2)
    apply_loyalty_discount = @basket.loyalty_discount(2)
    assert_equal(61.73, apply_loyalty_discount)
  end

  def test_loyalty_discount_without_card
    @basket2.add_item(@item)
    @basket2.add_item(@item2)
    apply_loyalty_discount = @basket2.loyalty_discount(2)
    assert_equal(62.99, apply_loyalty_discount)
  end

end