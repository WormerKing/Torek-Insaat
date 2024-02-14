# Torek-Insaat
Torek İnşaat web sitesi örneği
=======
### Torek inşaat adlı bir inşaat şirketinini resmi web sitesinin kodları
<p color="red">Bu sitenin yapılma amacı tamamen eğitim amaçlı olup hiçbir şekilde bir **firmayı ya da kuruluşu temsil etmemektedir !**</p>
<p color="red">Bu proje 2023-2024 güz dönemi mesleki uygulama ve proje dersi için hazırlanmıştır.</p>


* Ruby Version = 3.2.0
* Rails Version = 7.1.1


## Kurulum(Docker)
```
git clone https://github.com/WormerKing/Torek-Insaat.git
cd Torek-Insaat
docker-compose up --build -d
```

<hr>

## Kurulum(RVM)
```
git clone https://github.com/WormerKing/Torek-Insaat.git
cd Torek-Insaat
bundle install && bundle update
bin/rails db:drop && bin/rails db:create && bin/rails db:migrate && bin/rails db:seed
rails s
```

<hr>

#### Bazı görseller
![Anasayfa](/app/assets/images/github/anasayfa.png)<hr>
![Görsel](/app/assets/images/github/gorsel1.png)<hr>
![Görsel](/app/assets/images/github/gorsel2.png)<hr>
