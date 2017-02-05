require 'minitest/autorun'
require 'minitest/rg'


class TestCustomer < Minitest::Test

  def setup
    @customer = new.customer("Mo", true)
  end


end