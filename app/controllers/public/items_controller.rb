class Public::ItemsController < ApplicationController
  def index
    @customer = current_customer
    @genres = Genre.all
    @count = Item.count
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @customer = current_customer
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
