class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authorize
  before_action :set_i18n_locale_from_params

  allow_browser versions: :modern

  protected
    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
    
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice]=
          "#{params[:locale]} tanslation not available"
          logger.error flash.now[:notice]
        
      end
    end
  end
end
