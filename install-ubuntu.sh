# para nao pedir senha ao utilizar sudo, adicionar a linha abaixo no arquivo mais abaixo:
# neves ALL=(ALL) NOPASSWD:ALL
# sudo visudo -f /etc/sudoers.d/passwordless

echo "$(whoami) ALL=(ALL) NOPASSWD:ALL" > passwordless
sudo mv passwordless /etc/sudoers.d/
sudo chown root:root /etc/sudoers.d/passwordless
sudo chmod 440 /etc/sudoers.d/passwordless

# transformar em root
# sudo -i

sudo apt-get update
sudo apt-get -y install git build-essential sqlite3 libsqlite3-dev wget curl zsh libssl-dev exfat-utils openssh-server
sudo apt-get clean
sudo apt-get autoclean
sudo rm /var/cache/apt/archives/*.deb

# zsh shell
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
# definir zsh como o shell padrão do usuário logado
chsh -s /bin/zsh
# sair do shell e voltar para funcionar

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

gem update --system
gem install bundler

cat <<'EOF' > Gemfile
source 'https://rubygems.org'
gem "rails"
EOF
bundle install --verbose
rm Gemfile*

# ack code search
curl http://beyondgrep.com/ack-2.12-single-file > ack
chmod +x ack
sudo mv ack /usr/local/sbin/

# nodejs atualizado
sudo apt-get install -y software-properties-common python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get -y install nodejs

# nao pedir senha
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -q -y install mysql-server

sudo apt-get install -y php5 php5-mysql php5-gd php5-curl php5-json
sudo apt-get install -y apache2

# jdk 7
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer

# add Applications caso não exista.
mkdir -p ~/Applications

# install PHPStorm 7
cd ~/Applications
wget http://download.jetbrains.com/webide/PhpStorm-7.1.3.tar.gz
tar -xvf PhpStorm-7.1.3.tar.gz
~/Applications/PhpStorm-133.982/bin/phpstorm.sh
rm ~/Applications/PhpStorm-7.1.3.tar.gz


# install RubyMine 6
cd ~/Applications
wget http://download.jetbrains.com/ruby/RubyMine-6.0.3.tar.gz
tar -xvf RubyMine-6.0.3.tar.gz
~/Applications/RubyMine-6.0.3/bin/rubymine.sh
rm ~/Applications/RubyMine-6.0.3.tar.gz


# install Sublime Text 2
cd ~/Applications
wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.tar.bz2
tar -xvf Sublime\ Text\ 2.0.2.tar.bz2
rm Sublime\ Text\ 2.0.2.tar.bz2
sudo ln -s ~/Applications/Sublime\ Text\ 2/sublime_text /usr/bin/subl


# instal mysql-workbench
sudo apt-get install -y mysql-workbench

# gitg
sudo apt-get install gitg
echo alias gitx='gitg' >> .bashrc

# gerenciar alteracoes no /etc
cd /tmp
git clone git://git.kitenet.net/etckeeper.git
sudo apt-get -y install bzr etckeeper
cd etckeeper
make install
sudo etckeeper init
cd /etc
sudo git commit -m "first commit"
