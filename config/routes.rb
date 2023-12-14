Rails.application.routes.draw do
    root "main#index"
    

    devise_for :admins, :controllers => {
        :registrations => "admins/registrations",
        :sessions => "admins/sessions"
    }, path: 'admin', path_names: {
        sign_in: 'login',
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'register', 
        sign_up: 'cmon_let_me_in'
    },:skip => %i[ passwords confirmations sessions ]

    devise_scope :admin do
        get "/login",to: "admins/sessions#new", as: :login_new
        post "/login.admin",to: "admins/sessions#create", as: :login_create
        delete "/logout",to: "admins/sessions#destroy", as: :logout
    end

    authenticated :admins do
        # get "/bizden-haberler/ekle" => "bizden_haberler#ekle",controller: :bizden_haberler    
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
end