echo "ADMIN_USER=$ADMIN_USER"

sudo apt update -y && sudo apt upgrade -y

# Install Desktop
echo $(date) " linux-install-desktop - Starting Script"
sudo apt install ubuntu-gnome-desktop -y

# Install xrdp
echo $(date) " linux-install-xrdp - Starting Script"
sudo apt install xrdp -y
sudo systemctl enable xrdp


# Install xfce4
echo $(date) " linux-install-xfce4 - Starting Script"
sudo apt-get install xfce4 -y

echo xfce4-session > /home/$ADMIN_USER/.xsession 
sed -i '8d' /etc/xrdp/startwm.sh

echo "startxfce4" >> /etc/xrdp/startwm.sh
sudo service xrdp restart

# Install Docker-CE
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y


# Install firefox
sudo apt-get install firefox -y

# Install chrome
sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update -y

sudo apt-get install google-chrome-stable -y

sudo snap install vlc
sudo snap install teams-for-linux
sudo snap install slack --classic
