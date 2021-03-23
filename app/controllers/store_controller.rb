class StoreController < ApplicationController
  before_action :set_store_counter, only:[:index]

  def index
    @products = Product.order(:title)
  end

  private
  def set_store_counter 
    if session[:counter].nil?
      session[:counter] = 1
    elsif 
      session[:counter] += 1
    end
    @session_counter = session[:counter]
  end
end
