class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
    @customer = current_customer
  end

  def create
    @customer = current_customer
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      @customer = current_customer
      redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = Address.all
      render :index
    end
  end

  def edit
    @customer = current_customer
    @address = Address.find(params[:id])
  end

  def update
    @customer = current_customer
    @address = Address.find(params[:id])
    if @address.update(address_params)
      @customer = current_customer
       redirect_to addresses_path
    else
      @customer = current_customer
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)

  end

end
