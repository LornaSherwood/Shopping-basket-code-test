require 'minitest/autorun'
require 'minitest/rg'
require_relative '../till.rb'
require_relative '../discount.rb'
require_relative '../basket.rb'
require_relative '../item.rb'
require_relative '../customer.rb'

class TestTill < Minitest::Test

  def setup
    @customer1 = Customer.new("Mo", true)
    @customer2 = Customer.new("Jessica", false)
    @basket = Basket.new(@customer1)
    @basket2 = Basket.new(@customer2)
    @item = Item.new("Trainers", 69.99)
    @item2 = Item.new("Shorts", 34.99)
    @item3 = Item.new("T-shirt", 12.99)
    @till = Till.new(@basket)
    @till2 = Till.new(@basket2)
  end

  def setup_basket
    @basket.add_item(@item)
    @basket.add_item(@item)
    @basket.add_item(@item2)
    @basket.add_item(@item3)
  end

  def setup_basket_no_loyalty
    @basket2.add_item(@item)
    @basket2.add_item(@item2)
    @basket2.add_item(@item3)
  end

  def test_can_get_basket_total
    setup_basket()
    assert_equal(187.96, @till.get_basket_total)
  end

  def test_can_apply_bogof_discount
    setup_basket()
    new_cost = @till.apply_bogof_discount(@till.get_basket_total)
    assert_equal(117.97, new_cost)
  end

  def test_can_apply_percent_discount
    setup_basket
    new_cost = @till.apply_percent_discount(@till.get_basket_total)
    assert_equal(169.16, new_cost)
  end

  def test_can_apply_loyalty_discount
    setup_basket()
    new_cost = @till.apply_loyalty_discount(@till.get_basket_total)
    assert_equal(184.20, new_cost)
  end

  def test_loyalty_deduction_not_applied_if_no_card
    setup_basket_no_loyalty()
    new_cost = @till2.apply_loyalty_discount(@till2.get_basket_total)
    assert_equal(117.97, new_cost)
  end

  def test_can_apply_all_discounts_in_order
    setup_basket()
    new_cost = @till.apply_all_discounts(@till.get_basket_total)
    assert_equal(104.05, new_cost)
  end

end