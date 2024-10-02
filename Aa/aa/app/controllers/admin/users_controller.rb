# app/controllers/admin/users_controller.rb
module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only

    def index
      @users = User.all
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: 'Usuario eliminado.'
    end

    private

    def admin_only
      unless current_user.admin?
        redirect_to root_path, alert: "Acceso denegado."
      end
    end
  end
end
