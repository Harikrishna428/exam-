class ProductsController < ApplicationController

  # before_action :authenticate_user!

  def new
    @product = Product.new
  end

  def index
    @products =Product.all
  end

  def create
    #render plain: params[:product].inspect
    @product = Product.new(product_param) 

    if @product.save
      flash[:notice] = "the product  was succesfully saved"
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = @product = Product.find(params[:id])
    if @product.update(product_param)
      redirect_to product_path(@product)

    else
      
      render 'edit'

    end
        
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path
    end
  end

  private

  def product_param
  params.require(:product).permit(:name,:description,:price)    

  end 
end
