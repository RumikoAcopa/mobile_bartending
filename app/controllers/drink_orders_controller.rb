class DrinkOrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #before_action :set_drink

  def index
    @orders = DrinkOrder.all #not sure why i can't use current_user.orders here  
  end

  def new
    if params[:drink_id]
      set_drink
      @order = DrinkOrder.new(drink_id: params[:drink_id])
    else
      @order = DrinkOrder.new
    end  
  end

  def show
    @orders = current_user.drink_orders.find(params[:id])
  end

  def edit
    set_order
  end

  def create
    @order = current_user.drink_orders.build(drink_order_params)
    if @order.save
      redirect_to drink_order_path(@order)
    else
      render :new
    end
  end

  def update
    if @order.update(drink_order_params)
      redirect_to drink_order_path(@order)
    else
      render :edit 
    end
  end

  def destroy
   @order.destroy
   redirect_to drink_orders_path
  end

  private

  def set_order
    @order = DrinkOrder.find(params[:id])
  end
  
  def set_drink
    @drink = Drink.find(params[:drink_id])
  end

  def drink_order_params
    params.require(:drink_order).permit(:user_id, :drink_id, :special_instructions, :quantity, :name)
  end 


end