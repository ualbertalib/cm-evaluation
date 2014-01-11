#preparing packages
sudo yum groupinstall 'Development Tools'
sudo yum -y install zlib-devel openssl-devel java
#!/bin/sh

#compiling libyaml
if [ ! -f  yaml-0.1.4.tar.gz ]; then
  wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
fi
if [ ! -d yaml-0.1.4 ]; then
  tar xzvf yaml-0.1.4.tar.gz
fi
if [ ! -f /usr/local/lib/libyaml.a ]; then
  cd yaml-0.1.4
  ./configure --prefix=/usr/local
  make
  sudo make install
  cd
fi

#ruby 1.9.3
if [ ! -f ruby-1.9.3-p484.tar.gz ]; then
  wget http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p484.tar.gz
fi
if [ ! -d ruby-1.9.3-p484 ]; then 
  tar xvzf ruby-1.9.3-p484.tar.gz
fi
if [ "$(/usr/local/bin/ruby -v)" ]; then
  echo "ruby already installed"
else
  cd ruby-1.9.3-p484
  ./configure
  make
  sudo make install
  cd
  echo "ruby installed"
fi

#rubygems
if [ ! -f rubygems-2.1.11.tgz ]; then
  wget http://production.cf.rubygems.org/rubygems/rubygems-2.1.11.tgz
fi
if [ ! -d rubygems-2.1.11 ]; then
  tar xvzf rubygems-2.1.11.tgz
fi
if [ "$(sudo /usr/local/bin/gem install rubygems-test)" ]; then
  echo "rubygems already installed"
else
  cd rubygems-2.1.11
  sudo /usr/local/bin/ruby setup.rb
  cd
  
fi

# gem installs
if [ false=="$(/usr/local/bin/gem list bundler -i)" ]; then
  sudo /usr/local/bin/gem install bundler
fi
if [ false=="$(/usr/local/bin/gem list rails -i)" ]; then
  sudo /usr/local/bin/gem install rails
fi