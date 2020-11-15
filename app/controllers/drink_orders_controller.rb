class DrinkOrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_drink
  before_action :authenticate_user!
  

  def index
    @orders = @drink.drink_orders
    #if there is a drink, make orders for that drink else make it all
    #this users orders.
  end

  def new
    @order = DrinkOrder.new
    if @drink
      @id = @drink.id
    else
      @id = nil
    end
  end

  def show
    @orders = current_user.drink_orders.find(params[:id])
  end

  def edit
    
  end

  def create
    @order = current_user.drink_orders.build(drink_order_params)
    #@order.drink.id = @drink.id
    if @order.save
      redirect_to current_user_drinks_order_drinks_path(@order)
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
   redirect_to drinks_path
  end

  private

  def set_order
    @order = DrinkOrder.find(params[:id])
  end
  
  def set_drink
    @drink = Drink.find_by_id(params[:drink_id])
  end

  def drink_order_params
    params.require(:drink_order).permit(:user_id, :drink_id, :special_instructions, :quantity, :name)
  end 


end