class Discount

  def initialize(basket)
    @basket = basket
    @cost_for_deduction = 20 #must spend this amount for discount to apply
    @percent_deduction = 10 # percent discount applied
    @percent_loyalty_deduction = 2  #percent discount applied if have loyalty card
  end

  def bogof_total_reduction
    discount = 0
    item_array = @basket.contents.uniq() # array representing each kind of item in basket
    for item in item_array #for each kind of item
      item_count = @basket.contents.count(item)
      if item_count.even?
        discount += (0.5 * item_count) * item.cost()
      elsif item_count.odd?
        discount += (0.5 * (item_count - 1)) * item.cost()
      else
        return
      end
    end
    return discount.round(2)
  end

  def percent_discount_reduction(current_cost)
    if current_cost > @cost_for_deduction
      percent_discount = current_cost * (@percent_deduction/100.0)
      return percent_discount.round(2)
    else
      return 0.0
    end
  end

  def loyalty_discount_reduction(current_cost)
      new_cost = current_cost * (@percent_loyalty_deduction/100.0)
      return new_cost.round(2)
  end

end