sudo apt-get update
sudo apt-get -y install git
sudo apt-get -y install build-essential
sudo apt-get -y install sqlite3
sudo apt-get -y install libsqlite3-dev
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
rbenv install 2.1.0
rbenv global 2.1.0

ruby -v
echo "gem: --no-ri --no-rdoc -V" > ~/.gemrc
gem update --system
gem install bundler
cat <<'EOF' > Gemfile
source 'https://rubygems.org'
gem "rails"
EOF
bundle install --verbose

sudo apt-get install -y software-properties-common python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs