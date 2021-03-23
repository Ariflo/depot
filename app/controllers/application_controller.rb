class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_current_time_and_date, only:[:index]

    def set_current_time_and_date
        @time = Time.now
    end

    def reset_store_session_counter
      unless session[:counter].nil?
        session[:counter] = 0
      end
    end
end
