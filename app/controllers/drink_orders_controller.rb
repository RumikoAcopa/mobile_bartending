class DrinkOrdersController < ApplicationController
before_action :set_order, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

def index
    @orders = DrinkOrder.all #not sure why i can't use current_user.orders here  
end

def new
   @order = DrinkOrder.new
end

def show
  @orders = current_user.drink_orders.find(params[:id])
end

def edit
  set_order
end

def create
  @order = current_user.drink_orders.build(order_params)
  if @order.save
    redirect_to drink_order_path(@order)
  else
    render :new
  end
end

def update
   if @order.update(order_params)
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

def drink_order_params
    params.require(:order).permit(:user_id, :drink_id, :special_instructions, :quantity)
end 
end