class Admin::OrdersController < ApplicationController
  #before_action :if_not_admin

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
   @order = Order.find(params[:id])
   @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end

  def if_not_admin
    redirect_to root_path unless current_admin.id?
  end
end
