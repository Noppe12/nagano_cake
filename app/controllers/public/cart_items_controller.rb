class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @cart_item = current_customer
    @customer = current_customer
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      @items = Item.all
      redirect_to items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
       flash[:success] = "You have updated successfully."
       redirect_to cart_items_path
    else
      render :edit
    end
  end

  def destroy_all
    @customer = current_customer
    @customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
