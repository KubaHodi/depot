class StoreController < ApplicationController
  
  before_action :licznik_odwiedzin, only: [:index]

  def index
    @products = Product.order(:title)
  end   
  private
  def licznik_odwiedzin
    if session[:counter].nil?
      session[:counter] = 0
    else
      session[:counter] += 1
    end  
  end

end

