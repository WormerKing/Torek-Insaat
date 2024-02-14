=======
<<<<<<< HEAD
# Torek-Insaat
Torek İnşaat web sitesi örneği
=======
### Torek inşaat adlı bir inşaat şirketinini resmi web sitesinin kodları

* Ruby Version = 3.2.0
* Rails Version = 7.1.1


## Kurulum(Docker)
```
git clone https://github.com/WormerKing/Torek-Insaat.git
cd Torek-Insaat
docker-compose up --build -d
```

========

## Kurulum(RVM)
```
git clone https://github.com/WormerKing/Torek-Insaat.git
cd Torek-Insaat
bundle install && bundle update
bin/rails db:drop && bin/rails db:create && bin/rails db:migrate && bin/rails db:seed
rails s
```