if [$1]
		name=$1
else
		echo "Please specify you main account name as arugument"
		exit 1
fi

echo -e "[USER]Switching to root..."
su

echo -e "[ROOT]Updating..."
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

echo -e "[ROOT]Installing basics..."
apt-get install -y sudo git vim gcc clang wget curl ufw fail2ban psad htop ncdu figlet valgrind
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
sleep 2

echo -e "[ROOT]Installing oh-my-zsh..."
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -`)"

echo -e "[ROOT]Modifying zsh theme..."
cat ~/.zshrc | sed -e 's/robbyrussell/ys/g' > ~/.zshrc

echo -e "[ROOT]Installing nodejs..."
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
apt-get install -y nodejs
echo "node version : `npm -v`" > ~/node_version
echo "npm version : `npm -v`" >> ~/node_versions

echo -e "[ROOT]Closing root session..."
su $name

echo -e "[USER]Installing oh-my-zsh..."
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo -e "[ROOT]Modifying zsh theme..."
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/' ~/.zshrc

echo -e "[USER]Installing node global modules..."
sudo npm install -g pm2

echo -e "[USER]Setting up pm2..."
sudo pm2 startup

exit
