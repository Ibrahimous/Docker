sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update -y

sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

#Check and modify the latest relase: as of 13th September 2022, it's: 2.10.2 - https://github.com/docker/compose/releases
sudo curl -L https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo apt autoremove

docker-compose --version
#Expected output:
#Docker Compose version v2.10.2

#Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them


