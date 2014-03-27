# lubuntu mini.iso (apenas linha de comando)
# 1.1GB

# instalar lubuntu sobre o ubuntu mini.iso
sudo -i
apt-get -y install lubuntu-core
# 2.4GB
apt-get dist-upgrade
apt-get autoclean
rm /var/cache/apt/archives/*.deb
# 2.1GB
reboot

# agora começa a instalação de verdade
# nao pedir senha para utilizar sudo
echo "$(whoami) ALL=(ALL) NOPASSWD:ALL" > passwordless
sudo mv passwordless /etc/sudoers.d/
sudo chown root:root /etc/sudoers.d/passwordless
sudo chmod 440 /etc/sudoers.d/passwordless

sudo apt-get update
sudo apt-get -y install git build-essential sqlite3 libsqlite3-dev wget curl zsh libssl-dev exfat-utils openssh-server
# 2.2GB

sudo apt-get -y install php5-cli php5-mysql php5-sqlite apache2 libapache2-mod-php5

# zsh shell
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
# definir zsh como o shell padrão do usuário logado
chsh -s /bin/zsh
# sair do shell e voltar para funcionar
# 2.3GB

# nao pedir senha do mysql, utilizar sem senha
sudo -i
export DEBIAN_FRONTEND=noninteractive
apt-get -q -y install mysql-server
exit

# permitir conexao externa
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
# permitir acesso externo %.root
echo  "SELECT Host, User FROM user;" | mysql -u root mysql
echo  "GRANT ALL ON *.* TO root;" | mysql -u root
echo  "SELECT Host, User FROM user;" | mysql -u root mysql
sudo restart mysql
# 2.4GB

# nodejs atualizado
sudo apt-get install -y software-properties-common python-software-properties python g++ make
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get -y install nodejs
# 2.5GB

# Ambiente ruby/rails: rbenv/ruby/rails
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

echo "gem: --no-ri --no-rdoc -V" > ~/.gemrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

rbenv install 2.1.1 -v
rbenv global 2.1.1
#2.6GB

gem update --system
gem install bundler

cat <<'EOF' > Gemfile
source 'https://rubygems.org'
gem "rails"
EOF
bundle install --verbose
rm Gemfile*

# para conseguir compilar a gem mysql2
sudo apt-get -y install libmysql-ruby libmysqlclient-dev
#2.7GB

# SublimeText
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3059_amd64.deb
sudo dpkg -i sublime-text_build-*.deb
rm sublime-text_build-*.deb
# 2.8GB

#GitG (GitX alternative to Ubuntu)
wget https://download.gnome.org/sources/gitg/0.3/gitg-0.3.2.tar.xz
tar Jxf gitg-*.tar.xz
cd gitg-*/
sudo apt-get -y install intltool cmake pkg-config gtk-doc-tools gnome-common
git clone https://github.com/libgit2/libgit2.git
git clone https://git.gnome.org/browse/libgit2-glib
cd libgit2
mkdir build && cd build
cmake ..
cmake --build .
cd ../../libgit2-glib
./autogen.sh
./configure
make
make install

# Google Chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpkg -i google-chrome-stable_current_amd64.deb
#rm google-chrome-stable_current_amd64.deb
sudo apt-get -y install google-chrome-stable
# instalar dependências do Chrome
sudo apt-get -yf install

# jdk 7
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java7-installer
# 3.4

# PHPStorm (minimo 1GB de RAM, 2GB recomendado)
wget http://download.jetbrains.com/webide/PhpStorm-7.1.3.tar.gz
tar -xvf PhpStorm-*.tar.gz
rm PhpStorm-*.tar.gz
sudo mv PhpStorm-* /opt/PhpStorm
/opt/PhpStorm/bin/phpstorm.sh
#ln -s /opt/PhpStorm/bin/phpstorm.sh ~/Desktop/PhpStorm
# 3.0GB

# RubyMine
wget http://download-cf.jetbrains.com/ruby/RubyMine-6.0.3.tar.gz
tar -xvf RubyMine-*.tar.gz
rm RubyMine-*.tar.gz
sudo mv RubyMine-* /opt/RubyMine
/opt/RubyMine/bin/rubymine.sh

# cleanup
sudo apt-get clean
sudo apt-get autoclean
sudo rm /var/cache/apt/archives/*.deb
