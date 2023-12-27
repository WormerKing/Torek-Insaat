Rails.application.routes.draw do  
    unauthenticated :admin do
        root :to => 'main#index',as: :unauthenticated_root
    end

    unauthenticated :user do 
        root :to => 'main#index',as: :user_root
    end

    authenticated :admin do
        root :to => 'admins/panels#panel',as: :authenticated_root
        get "/panel" => "admins/panels#panel",:as => :admin_panel
        get "/admin/all" => "admins/panels#all_admins",:as => :all_admins
        
        # delete "/admin/delete/:name" => "admins/registrations#wormer",:as => :admin
    end

    devise_for :users, :controllers => {
        :registrations => "users/registrations",
        :sessions => "users/sessions"
    }, :path => '',:path_names => {
        edit: 'düzenle',
        sign_in: 'giris',
        sign_out: 'cikis', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'kayit', 
        sign_up: 'kayit_ol'
    }, :skip => %i[ passwords sessions confirmations ]

    devise_for :admins, :controllers => {
        :registrations => "admins/registrations",
        :sessions => "admins/sessions"
    }, path: 'admin', path_names: {
        edit: 'düzenle',
        sign_in: 'login',
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'kayıt', 
        sign_up: 'ekle'
    },:skip => %i[ passwords confirmations sessions ]

    devise_scope :admin do
        get "/login",to: "admins/sessions#new", as: :login_new
        post "/login.admin",to: "admins/sessions#create", as: :login_create
        delete "/logout",to: "admins/sessions#destroy", as: :logout
        delete "/admin/delete/:username" => "admins/registrations#destroy",:as => :admin
        # get "/admin/all" => "admins/panels#all_admins",:as => :all_admins
    end

    devise_scope :user do
        get "/giris_yap",to: "users/sessions#new",as: :user_login
        post "/giris_yap.user",to: "users/sessions#create", as: :user_login_post
        delete "/logout_user",to: "users/sessions#destroy", as: :logout_user
    end

    get "/bizden-haberler/ekle" => "bizden_haberler#ekle",controller: :bizden_haberler 
    post "/bizden-haberler/ekle" => "bizden_haberler#ekle_post",controller: :bizden_haberler,as: :bizden_haberler_ekle_post

    # devise_for :users, :skip => [ :passwords, :registrations, :confirmations]

    get "up" => "rails/#show", as: :rails_health_check

    # Navbar'da bulunan linklerin rotalanması


    # Kurumsal
    # get "/login" => "main#index",as: :login
    get "/hakkimizda" => "main#hakkimizda",as: :hakkimizda
    get "/faaliyet-raporu" => "main#faaliyet_raporu",as: :faaliyet_raporu
    get "/tarihce" => "main#tarihce",as: :tarihce
    get "/yonetim-kurulu" => "main#yonetim_kurulu",as: :yonetim_kurulu
    get "/organizasyon" => "main#organizasyon",as: :organizasyon
    get "/sosyal-sorumluluk" => "main#sosyal_sorumluluk",as: :sosyal_sorumluluk

    # Projeler
    get "/devam-eden-projeler" => "main#devam_eden_projeler",as: :devam_eden_projeler
    get "/tamamlanan-projeler" => "main#tamamlanan_projeler",as: :tamamlanan_projeler

    # Sektörler
    get "/insaat-sektoru" => "main#insaat_sektoru",as: :insaat_sektoru
    get "/enerji-sektoru" => "main#enerji_sektoru",as: :enerji_sektoru
    get "/turizm-sektoru" => "main#turizm_sektoru",as: :turizm_sektoru
    get "/danismanlik-sektoru" => "main#danismanlik_sektoru",as: :danismanlik_sektoru

    # Haberler
    get "/bizden-haberler" => "main#bizden_haberler",as: :bizden_haberler
    get "/basindan-haberler" => "main#basindan_haberler",as: :basindan_haberler

    # İnsan kaynakları
    get "/is-basvuru-formu" => "main#is_basvuru_formu",as: :is_basvuru_formu
    get "/calisan-adayi-aydinlatma-metni" => "main#calisan_adayi_aydinlatma_metni",as: :calisan_adayi_aydinlatma_metni

    # Faaliyet raporu pdf
    get "/faaliyet-raporu-pdf/:year" => "main#faaliyet_raporu_pdf",as: :faaliyet_raporu_pdf

    # Çalışan Adayı Aydınlatma Formu pdf
    get "/calisan-adayi-aydinlatma-metni-pdf" => "main#calisan_adayi_aydinlatma_metni_pdf",as: :calisan_adayi_aydinlatma_metni_pdf

    get "/tahmini-maliyet-hesaplama" => "main#tahmini_maliyet_hesaplama",:as => :tahmini_maliyet_hesaplama
    post "/tahmini-maliyet-hesaplama" => "main#tahmini_maliyet_hesaplama_post",:as => :tahmini_maliyet_hesaplama_post
end