module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only

    def index
      @events = Event.all
      @users = User.all
    end

    private

    def admin_only
      unless current_user.admin?
        redirect_to root_path, alert: "Acceso denegado."
      end
    end
  end
end
