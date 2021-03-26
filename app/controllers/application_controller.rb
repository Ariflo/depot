class ApplicationController < ActionController::Base
    before_action :authorize
    protect_from_forgery with: :exception

    before_action :set_current_time_and_date, only:[:index]

    protected
    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end

    def set_current_time_and_date
        @time = Time.now
    end

    def reset_store_session_counter
      unless session[:counter].nil?
        session[:counter] = 0
      end
    end

    def set_changed_product(product)
      @changed_product = product
    end

    def get_changed_product
      @changed_product
    end
end
