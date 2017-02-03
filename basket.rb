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





end