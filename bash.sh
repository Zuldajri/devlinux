echo "ADMIN_USER=$ADMIN_USER"

# Install Desktop
echo $(date) " linux-install-desktop - Starting Script"
sudo apt-get install ubuntu-desktop -y

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

