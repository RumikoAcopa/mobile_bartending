class DrinksController < ApplicationController
  before_action :authenticate_user!   
  before_action :set_drink, only: [:show, :edit, :update, :destroy]
    
    def index
      @drinks = current_user.drinks   
    end

    def new
      @drink = Drink.new
    end

    def show
      @drinks = current_user.drinks.find(params[:id])
    end

    def edit
      set_drink
    end

    def create
      @drink = current_user.drinks.build(drink_params)
      if @drink.save
        redirect_to drink_path(@drink)
      else
        render :new
      end
    end

    def update
       if @drink.update(drink_params)
         redirect_to drink_path(@drink)
       else
         render :edit 
       end
    end

    def destroy
     @drink.destroy
     redirect_to drinks_path
    end

    private

    def set_drink
        @drink = current_user.drinks.find(params[:id])
    end 

    def drink_params
        params.require(:drink).permit(:name, :ingredients, :price)
    end 
end


