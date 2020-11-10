class OrdersController < ApplicationController
before_action :set_order, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

def index
    @orders = Order.all #not sure why i can't use current_user.orders here  
end

def new
   @order = Order.new
end

def show
  @orders = current_user.orders.find(params[:id])
end

def edit
set_order
end

def create
  @order = current_user.orders.build(order_params)
  if @order.save
    redirect_to order_path(@order)
  else
    render :new
  end
end

def update
   if @order.update(order_params)
     redirect_to order_path(@order)
   else
     render :edit 
   end
end

def destroy
 @order.destroy
 redirect_to orders_path
end

private

def set_order
    @order = Order.find(params[:id])
end 

def order_params
    params.require(:order).permit(:quantity)
end 
end