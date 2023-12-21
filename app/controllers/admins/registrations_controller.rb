# frozen_string_literal: true
class Admins::RegistrationsController < Devise::RegistrationsController
    # before_action :authenticate_admin!, :only => [:new]
    before_action :kontrol
    before_action :find_admin,only: %i[ destroy ]
    skip_before_action :require_no_authentication, :only => [:new,:create,:edit,:update]
    # before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]

    def new
        @new_admin = Admin.new
    end

    def create
        @new_admin = Admin.new

        puts "#"*10000
        puts params.require(:admin)

        if (params[:admin][:password] == params[:admin][:password_confirmation])
            @new_admin = Admin.new(params.require(:admin).permit(:username,:email,:password))

            if (@new_admin.save)
                flash[:notice] = "Yönetici başarıyla eklendi"
                redirect_to "/"
            else
                flash[:error] = "hata meydana geldi"
                render :new
            end
        else
            flash[:error] = "Şifreler uyuşmuyor"
            render :new
        end

    end

    def edit
        puts "*"*1000
        puts params

        @admin = Admin.find_by_username(params[:format])
        redirect_to(all_admins_path) unless @admin
    end

    def update
        # FIXME güncelleme kısmı düzgün çalışmıyor
        @admin = Admin.find_by_username(params[:format])

        parametreler = params.require(:admin).permit(:username,:password,:password_confirmation)
        puts parametreler

        username = parametreler[:username]
        password = parametreler[:password]
        password_confirmation = parametreler[:password_confirmation]
        puts "&"*100


        if (username.empty?)
            if (password.empty?)
                redirect_to(all_admins_path)
            else
                if Admin.valid_password?(password) && password == password_confirmation
                    @admin.reset_password(password,password_confirmation)
                else
                    flash[:error] = "Parolalar uyuşmuyor"
                    render :edit
                    return
                end
            end
        else
            if Admin.valid_username?(username) && @admin.update(:username => username)
                flash[:notice] = "Kullanıcı adı başarıyla değiştirldi"
                puts "73 satır"
            else
                puts @admin.errors.full_messages
                flash[:error] = "Bu kullanıcı adını kullanamazsınız"
                render :edit
                return
            end

            unless password.empty?
                if Admin.valid_password?(password) && password == password_confirmation
                    @admin.reset_password(password,password_confirmation) if Admin.valid_password?(password)
                    puts "86 satır"
                    if @admin.username == current_admin.username
                        sign_out current_admin
                    end
                    redirect_to("/")
                    return      
                    
                else
                    flash[:error] = "wormer"
                    render :edit
                end
            end
        end

        # @admin.reset_password(parametreler.permit(:password),parametreler.permit(:password_confirmation))

        # @admin.valid_password?(parametreler.permit(:password)) && @admin.valid_password?(parametreler.permit(:password_confirmation)) 

        

    end

    def destroy
        puts "#"*1000
        puts "Silinecek kaydın kullanıcı adı : #{@admin.username}"
        puts params
        @admin.destroy

        redirect_to("/")
    end

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
    protected

    def kontrol
        redirect_to "/" unless admin_signed_in?
    end

    def find_admin
        @admin = Admin.find_by_username(params[:username])
    end
end
