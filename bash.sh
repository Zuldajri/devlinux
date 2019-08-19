echo "ADMIN_USER=$ADMIN_USER"

# Install Desktop
echo $(date) " linux-install-desktop - Starting Script"
sudo apt-get install ubuntu-desktop -y

# Install xrdp
echo $(date) " linux-install-xrdp - Starting Script"
sudo apt install xrdp -y
sudo systemctl enable xrdp


# Install xfce4
#echo $(date) " linux-install-xfce4 - Starting Script"
#sudo apt-get install xfce4 -y

#echo xfce4-session > /home/$ADMIN_USER/.xsession 
#sed -i '8d' /etc/xrdp/startwm.sh

#echo "startxfce4" >> /etc/xrdp/startwm.sh
#sudo service xrdp restart

# Install firefox
sudo apt-get install firefox -y

# Install chrome
sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update -y

sudo apt-get install google-chrome-stable -y

# Install Mailspring
sudo apt update -y
sudo apt install gdebi-core wget -y

wget -O ~/mailspring.deb "https://updates.getmailspring.com/download?platform=linuxDeb"

sudo gdebi ~/mailspring.deb -y

