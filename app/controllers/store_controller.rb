class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :set_store_counter, only:[:index]

  skip_before_action :authorize

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @changed_product = get_changed_product
    end
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
