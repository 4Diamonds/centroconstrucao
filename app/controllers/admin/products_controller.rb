class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create 

    @product = Product.new(params[:product])
    if @product.save
      redirect_to admin_products_path, notice: "Salvo com sucesso"
    else
      render :new
    end
  end

  def update
    @product = Customer.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to admin_products_path(@product), notice: "#{@product.name}, salvo com sucesso"
    else
      render :edit
    end

  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to admin_products_path, notice: "O Produto foi deletado com sucesso"
    end
  end

  private

  def load_product
    @product = Product.find(params[:id])
  end

end
