class Basket

  attr_reader :contents

  def initialize()
    @contents = []
    @total_cost = 0

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
    if contents.length != 0
      for item in contents
        total_cost += item.cost()
      end
      return total_cost
    else
      return @total_cost
    end

  end





end