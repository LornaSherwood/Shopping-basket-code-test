require 'minitest/autorun'
require 'minitest/rg'
require_relative '../discount.rb'
require_relative '../basket.rb'
require_relative '../item.rb'
require_relative '../customer.rb'

class TestDiscount < Minitest::Test

  def setup
    @customer = Customer.new("Mo", true)
    @customer2 = Customer.new("Jessica", false)
    @basket = Basket.new(@customer)
    @basket2 = Basket.new(@customer2)
    @item = Item.new("Trainers", 69.99)
    @item2 = Item.new("Shorts", 34.99)
    @item3 = Item.new("T-shirt", 12.99)
    @discount = Discount.new()
  end

  def test_Bogof_reduces_cost
    @basket.add_item(@item)
    @basket.add_item(@item2)
    amount_reduced = @discount.bogof_total_reduction(@basket)
    assert_equal(34.99, amount_reduced)
  end

  def test_Bogof_correct_3_items
    @basket.add_item(@item)
    @basket.add_item(@item2)
    @basket.add_item(@item3)
    amount_reduced = @discount.bogof_total_reduction(@basket)
    assert_equal(34.99, amount_reduced)
  end

  def test_percent_deduction_calculates_correctly_if_applied
    @basket.add_item(@item)
    @basket.add_item(@item2)
    current_cost = @basket.total_cost() - @discount.bogof_total_reduction(@basket)
    amount_reduced = @discount.percent_discount_reduction(current_cost, 10, 20.0)
    assert_equal(7.00, amount_reduced)
  end 

  def test_percent_deduction_calculates_correctly_if_not_applied
    @basket.add_item(@item3)
    current_cost = @discount.bogof_total_reduction(@basket)
    amount_reduced = @discount.percent_discount_reduction(current_cost, 10, 20.0)
    assert_equal(0.00, amount_reduced)
  end 

end