require 'minitest/autorun'
require 'minitest/rg'
require_relative '../customer.rb'


class TestCustomer < Minitest::Test

  def setup
    @customer = Customer.new("Mo", true)
  end

  def test_customer_has_loyalty
    assert_equal(true, @customer.loyalty())
  end

  def test_customer_has_name
    assert_equal("Mo", @customer.name())
  end

end