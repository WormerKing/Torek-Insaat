# frozen_string_literal: true
class Admins::PanelsController < ApplicationController
    def panel
        
        render "admins/admin_panel/panel"
    end

    def all_admins
        @admins = Admin.all

        render "admins/admin_panel/all_admins"
    end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
