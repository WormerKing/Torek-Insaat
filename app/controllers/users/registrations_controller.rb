# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
    def new
        @user = User.new
    end

    def create
        flash[:error] = []
        @user = User.new

        puts "#"*10000
        puts params.require(:user)

        if (params[:user][:password] == params[:user][:password_confirmation])
            @user = User.new(params.require(:user).permit(:firstname,:lastname,:username,:email,:password))
            @tel_no = params.require(:user).permit(:telephone_number).to_s
            @tel_no.gsub!(/\D/,"").gsub!(" ","")
            @tel_no = @tel_no.scan(/([0-9]{3})([0-9]{3})([0-9]{2})([0-9]{2})/).unshift("+90").flatten.join(" ")
            @user.telephone_number = @tel_no

            if (@user.save)
                flash[:notice] = "Kullanıcı başarıyla eklendi"
                puts "başarılı"
                sign_in(@user)
                redirect_to "/"
            else
                flash[:error] = @user.errors.full_messages
                puts @user.errors.full_messages
                puts "burda bir hata var satır 32"          
                redirect_to new_user_registration_path
            end
        else
            flash[:error] << "Şifreler uyuşmuyor"
            puts "hata"
            redirect_to new_user_registration_path
        end
    end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
