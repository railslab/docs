# para nao pedir senha ao utilizar sudo, adicionar a linha abaixo no arquivo mais abaixo:
# neves ALL=(ALL) NOPASSWD:ALL
sudo visudo -f /etc/sudoers.d/neves-passwordless

sudo apt-get update
sudo apt-get -y install git build-essential sqlite3 libsqlite3-dev wget curl zsh libssl-dev exfat-utils openssh-server

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
chsh -s /bin/zsh neves

# rbenv + ruby + rails
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
rbenv install 2.1.1 -v
rbenv global 2.1.1
gem update --system

echo "gem: --no-ri --no-rdoc -V" > ~/.gemrc
gem update --system
gem install bundler
cat <<'EOF' > Gemfile
source 'https://rubygems.org'
gem "rails"
EOF
bundle install --verbose
rm Gemfile*

# nodejs
sudo apt-get install -y software-properties-common python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get -y install nodejs
