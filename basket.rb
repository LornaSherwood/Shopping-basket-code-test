class Basket

  attr_reader :contents, :customer

  def initialize(customer)
    @contents = []
    @customer = customer
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

  



end