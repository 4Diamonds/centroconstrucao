class Admin::CustomersController < AdminController
  
  before_filter :load_customer, only: [:edit, :show]

  def index
  	@customers = Customer.all
  end

  def new
  	@customer = Customer.new
  end

  def create 
  	@customer = Customer.new(params[:customer])
  	if @customer.save
  	  redirect_to admin_customers_path, notice: "Salvo com sucesso"
  	else
      render :new
  	end
  end

  def update
  	@customer = Customer.find(params[:id])
  	if @customer.update_attributes(params[:customer])
  		redirect_to admin_customer_path(@customer), notice: "#{@customer.name}, salvo com sucesso"
  	else
  		render :edit
  	end
  end

  private

  def load_customer
  	@customer = Customer.find(params[:id])
  end

end
