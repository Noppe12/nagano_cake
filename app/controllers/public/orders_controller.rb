class Public::OrdersController < ApplicationController

  def index
    @customer = current_customer
    @orders = current_customer.orders
  end

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:customer_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
        render :new
    end
  end


  def create
    @customer = current_customer
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @order_detail = OrderDetail.new #初期化宣言
      @order_detail.item_id = cart_item.item_id #商品idを注文商品idに代入
      @order_detail.amount = cart_item.amount #商品の個数を注文商品の個数に代入
      @order_detail.price = cart_item.item.with_tax_price #消費税込みに計算して代入
      @order_detail.order_id =  @order.id #注文商品に注文idを紐付け
      @order_detail.save #注文商品を保存
    end #ループ終わり

    current_customer.cart_items.destroy_all #カートの中身を削除
    redirect_to complete_orders_path
  end

  def complete
    @customer = current_customer
  end

  def show
    @customer = current_customer
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :postage, :price, :pay_status, :order_status)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end
