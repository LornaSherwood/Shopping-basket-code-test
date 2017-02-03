require 'minitest/autorun'
require 'minitest/rg'
require_relative '../item.rb'

class TestItem < Minitest::Test

  def setup
    @item = Item.new("Trainers", 69.99)
  end

  def test_item_has_name
    assert_equal("Trainers", @item.name())
  end

  def test_item_has_value
    assert_equal(69.99, @item.cost())
  end

end


