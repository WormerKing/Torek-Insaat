Rails.application.routes.draw do
  get "up" => "rails/#show", as: :rails_health_check

  root "main#index"
end
