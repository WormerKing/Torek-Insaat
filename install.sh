echo "Ubuntu kurulum işlemi başladı"

sudo adduser wormer
sudo usermod -a -G sudo wormer

sudo apt update -y && sudo apt upgrade -y

cd /home/wormer

wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.3.3/fastfetch-2.3.3-Linux.deb
sudo dpkg -i fastfetch-2.3.3-Linux.deb

curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh

git clone https://github.com/WormerKing/Torek-Insaat.git
cd Torek-Insaat/

sudo apt install docker-compose -y
sudo docker-compose up --build
