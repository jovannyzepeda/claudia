class RegistroController < Devise::RegistrationsController
  before_action :autenticacion_normal!, except: [:new,:create,:destroy]
  before_action :is_loggin, only: [:new,:create]
  private

  def sign_up_params
    params.require(:user).permit(:nombre, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:nombre, :email, :password, :password_confirmation, :current_password)
  end
end