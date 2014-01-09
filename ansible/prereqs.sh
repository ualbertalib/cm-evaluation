#preparing packages
sudo yum groupinstall 'Development Tools'
sudo yum install -y wget zlib1g-dev zlib-devel java
#compiling libyaml
wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
tar xzvf yaml-0.1.4.tar.gz
cd yaml-0.1.4
./configure --prefix=/usr/local
make
sudo make install
cd
#compiling ruby 1.9.3
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
tar xvzf ruby-1.9.3-p194.tar.gz
cd ruby-1.9.3-p194
./configure
make
sudo make install
cd
#rubygems
wget http://rubyforge.org/frs/download.php/76073/rubygems-1.8.24.tgz
tar xvzf rubygems-1.8.24.tgz
cd rubygems-1.8.24
sudo /usr/local/bin/ruby setup.rb
cd

# gem installs
gem install bundler
gem install rails
