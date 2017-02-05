class Till

  def initialize (basket)
    @basket = basket
    @discount = Discount.new(@basket)
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
 




  

end

# get basket total cost
# apply bogof
# apply percent discount
# apply loyalty discount
