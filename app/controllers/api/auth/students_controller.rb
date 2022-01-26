class Api::Auth::StudentsController < DeviseTokenAuth::RegistrationsController

  private
  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation, :address, :phone_number, :join_date)
  end
end
