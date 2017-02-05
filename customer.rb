class Customer

  attr_reader :loyalty

  def initialize(name, loyalty)
    @name = name
    @loyalty = loyalty
  end

  def set_loyalty(boolean)
    @loyalty = boolean
  end

end