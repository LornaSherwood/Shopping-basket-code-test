class Till

  def initialize (basket)
    @basket = basket
    @discount = Discount.new(@basket)
    @customer = @basket.customer()
  end

  def get_basket_total
    return @basket.total_cost()
  end

  def apply_bogof_discount(basket_cost)
    cost_discount_deducted = basket_cost - @discount.bogof_total_reduction()
    return cost_discount_deducted.round(2)
  end

  def apply_percent_discount(basket_cost)
    cost_discount_deducted = basket_cost - @discount.percent_discount_reduction(basket_cost)
    return cost_discount_deducted.round(2)
  end

  def apply_loyalty_discount(basket_cost)
    if @customer.loyalty == true
    cost_discount_deducted = basket_cost - @discount.loyalty_discount_reduction(basket_cost)
      return cost_discount_deducted.round(2)
    else
      return basket_cost
    end
  end

  def apply_all_discounts(basket_cost)
    basket_cost = apply_bogof_discount(basket_cost) #resets basket_cost to apply bogoff
    basket_cost = apply_percent_discount(basket_cost)#resets again to apply percent
    basket_cost = apply_loyalty_discount(basket_cost)#resets again to apply loyalty
    return basket_cost
  end 

end


