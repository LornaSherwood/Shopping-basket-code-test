class Basket

  attr_reader :contents

  def initialize()
    @contents = []

  end

  def count_items
    return contents.length()
  end

  def add_item(item)
    contents << item
  end

  def remove_item(item)
    contents.delete(item)
  end

  def empty
    @contents = []
  end

  def total_cost
    total_cost = 0
    for item in contents
      total_cost += item.cost()
    end
    return total_cost.round(2)
  end

  def bogof_total_cost
    total_cost = 0
    for item in contents
      position = contents.index(item)
        if position.even?
          total_cost += item.cost()
        end
    end
    return total_cost.round(2)
  end

  def percent_discount(percent) # input percent so that more flexible in future
    if bogof_total_cost > 20.00
      discount_cost = bogof_total_cost() * (1 - (percent/100.0))
      return  discount_cost.round(2)
    else
      return bogof_total_cost
    end
  end



end