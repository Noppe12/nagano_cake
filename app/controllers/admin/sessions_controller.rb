class Admin::SessionsController < ApplicationController

  def new
  end

  def create
  end

  def destroy
  end

  protected
    def after_sign_in_path_for(resource)
      root_to
    end
    def after_sign_out_path_for(resource)
      new_admin_session_path
    end
end
