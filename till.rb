class Till

  def initialize (basket)
    @basket = basket
    @discount = Discount.new(@basket)
    @customer = @basket.customer()
  end

  def get_basket_total
    return @basket.total_cost()
  end

  def apply_bogof_discount
    cost_discount_deducted = get_basket_total() - @discount.bogof_total_reduction()
    return cost_discount_deducted.round(2)
  end

  def apply_percent_discount
    cost_discount_deducted = get_basket_total() - @discount.percent_discount_reduction(get_basket_total(), 10, 20.0)
    return cost_discount_deducted.round(2)
  end

  def apply_loyalty_discount
    if @customer.loyalty == true
    cost_discount_deducted = get_basket_total() - @discount.loyalty_discount_reduction(get_basket_total(), 2)
      return cost_discount_deducted.round(2)
    else
      return get_basket_total
    end
  end  

end


