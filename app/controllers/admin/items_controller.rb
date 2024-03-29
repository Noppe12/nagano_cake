class Admin::ItemsController < ApplicationController
  #before_action :if_not_admin

  def index
    @items = Item.page(params[:page]).order(:id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "You have created book successfully."
      redirect_to admin_item_path(@item.id)
    else
      @items = Item.page(params[:page]).order(:id)
      render :index
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       flash[:success] = "You have updated book successfully."
       redirect_to admin_items_path
    else
      render :edit
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
  end

end
