class CustomersController < ApplicationController


  def index
  	@products = Product.all
  end

end
