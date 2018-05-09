class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :current_user_profile_page

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    def login(user)
        session[:user_id] = user.id
    end 
    def logged_in?
        !!current_user
    end
    def login_required
        redirect_to root_path if !logged_in?
    end
    def authentication_required(user)
        redirect_to logout_path if (current_user != user && !current_user.admin)
    end
    def current_user_profile_page
        current_user.admin ? current_user : user_achievements_path(current_user)
    end

end
