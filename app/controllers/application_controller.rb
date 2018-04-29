class ApplicationController < ActionController::Base
    helper_method :current_user, :is_user_authenticated?

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])

    end
    def is_user_authenticated?
        !!current_user
    end
end
