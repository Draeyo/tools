echo -e "[USER]Switching to root..."
su

echo -e "[ROOT]Updating..."
apt-get update
apt-get upgrade

echo -e "[ROOT]Installing basics..."
apt-get install -y sudo git vim fail2ban psad htop wget curl ncdu figlet ufw
echo -e "Setting up ufw..."
ufw enable
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow ftp
ufw allow sftp
ufw allow 443/tcp
ufw allow 3000
ufw allow 8080
ufw status verbose

echo -e "[ROOT]Installing oh-my-zsh..."
sh -c "`wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -`"

echo -e "[ROOT]Modifying zsh theme..."
cat ~/.zshrc | sed -e 's/robbyrussell/ys/g' > ~/.zshrc

echo -e "[ROOT]Installing nodejs..."
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
apt-get install -y nodejs
echo "node version : `npm -v > ~/node_version`"
echo "npm version : `npm -v >> ~/node_versions`"

echo -e "[ROOT]Closing root session..."
exit

echo -e "[USER]Installing oh-my-zsh..."
sh -c "`wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -`"

echo -e "[ROOT]Modifying zsh theme..."
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/' ~/.zshrc

echo -e "[USER]Installing node global modules..."
sudo npm install -g pm2

echo -e "[USER]Setting up pm2..."
sudo pm2 startup
