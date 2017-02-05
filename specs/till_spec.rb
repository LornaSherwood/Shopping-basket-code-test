require 'minitest/autorun'
require 'minitest/rg'
require_relative '../till.rb'
require_relative '../discount.rb'
require_relative '../basket.rb'
require_relative '../item.rb'
require_relative '../customer.rb'

class TestTill < Minitest::Test

  def setup
    @till = Till.new(@basket, @customer1)
    @basket = Basket.new(@customer1)
    @basket2 = Basket.new(@customer1)
    @customer1 = Customer.new("Mo", true)
    @item = Item.new("Trainers", 69.99)
    @item2 = Item.new("Shorts", 34.99)
    @item3 = Item.new("T-shirt", 12.99)

  end

  def setup_basket
    @basket.add_item(@item)
    @basket.add_item(@item2)
    @basket.add_item(@item3)
    return @basket
  end


  def test_can_get_basket_total
    assert_equal(117.97, @till.get_basket_total(setup_basket))
  end




end