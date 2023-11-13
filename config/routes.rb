Rails.application.routes.draw do
    devise_for :admin
    devise_scope :admin do
        get "login",to: "devise/sessions#new"
    end

    get "up" => "rails/#show", as: :rails_health_check

    root "main#index"
end
