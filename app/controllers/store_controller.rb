class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :set_store_counter, only:[:index]

  skip_before_action :authorize

  def index
    @products = Product.order(:title)
    @changed_product = get_changed_product
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
