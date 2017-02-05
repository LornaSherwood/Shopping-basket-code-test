class Till



  def initialize (basket, customer)
    @basket = basket
    @customer = customer
  end

  def get_basket_total(basket)
    return basket.total_cost
  end




  

end

# get basket total cost
# apply bogof
# apply percent discount
# apply loyalty discount
