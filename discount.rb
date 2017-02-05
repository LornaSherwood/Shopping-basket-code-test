class Discount



  def initialize(basket)
    @basket = basket
  end

  def bogof_total_reduction 
    free_items_value = 0.0
    for item in @basket.contents
      position = @basket.contents.index(item)
      if position.odd?
        free_items_value += item.cost
      end
    end
    return free_items_value # value to reduce basket.total_cost by
  end

  def percent_discount_reduction(current_cost, percent, value) # input percent/value so that more flexible in future
    if current_cost > value
      percent_discount = current_cost * (percent/100.0)
      return percent_discount.round(2)
    else
      return 0.0
    end
  end








  












end