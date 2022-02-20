# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected
  
  def after_sign_in_path_for(resource)
    customers_my_page_path
  end

  def reject_user
    @customer = Customer.find(params[:id])
    if @customer
      if @user.valid_password?(params[:customer][:password]) &&  (@customer.active_for_authentication? == true)
        redirect_to new_customer_registration_path
      end
    end
  end
end
