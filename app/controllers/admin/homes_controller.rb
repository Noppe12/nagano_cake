class Admin::HomesController < ApplicationController
  #before_action :if_not_admin

  def top
    @orders = Order.page(params[:page]).reverse_order
  end

  #private
  #def if_not_admin
    #redirect_to root_path unless current_user.admin?
  #end
end
