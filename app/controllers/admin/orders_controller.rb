class Admin::OrdersController < ApplicationController
  before_action :if_not_admin

  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @item = Item.find(params[:id])
    @order_details = @order.order_details
  end

  def update
   @order = Order.find(params[:id])
   @order_details = @order.order_details

    if @order.update(order_params)
       @order.order_detail.making_status == 1
       redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
