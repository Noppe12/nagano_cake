class Admin::OrderDetailsController < ApplicationController
  before_action :if_not_admin
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order_detail.update(order_detail_params)
       redirect_to request.referer
    else
      redirect_to request.referer
    end
    
  end
  
  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
