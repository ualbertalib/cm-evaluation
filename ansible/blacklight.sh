#!/bin/sh

#preparing packages
sudo yum -y groupinstall 'Development Tools'

#packages.library.ualberta.ca
if [ ! -f /etc/yum.repos.d/rhel6extras.repo ]; then
	sudo cp /vagrant/rhel6extras.repo /etc/yum.repos.d/rhel6extras.repo
fi

#epel
if [ ! -f /etc/yum.repos.d/epel.repo ]; then
	wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
	sudo rpm -Uvh epel-release-6*.rpm
fi

sudo yum -y install wget npm sqlite-devel httpd-devel openssl-devel zlib-devel curl-devel expat-devel gettext-devel patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel bzip2 mysql-server openssl-devel java-1.6.0-sun java-1.6.0-sun-devel

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

PATH=/usr/local/bin:$PATH

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
  sudo /usr/local/bin/ruby setup.rb --no-document
  cd 
fi

#gem installs
if [ false=="$(/usr/local/bin/gem list bundler -i)" ]; then
  sudo /usr/local/bin/gem install bundler --no-ri --no-rdoc
fi
if [ false=="$(/usr/local/bin/gem list rails -i)" ]; then
  sudo /usr/local/bin/gem install rails --no-ri --no-rdoc
fi
if [ false=="$(/usr/local/bin/gem list devise-guests -i)" ]; then
  sudo /usr/local/bin/gem install devise-guests --no-ri --no-rdoc
fi

#my_app create
if [ ! -f /root/my_app/README.rdoc ]; then
	/usr/local/bin/rails new my_app
	cd my_app
	echo gem \'blacklight\' >> Gemfile
	/usr/local/bin/bundle install
else
	cd /root/my_app
fi

#blacklight with devise for authentication
/usr/local/bin/rails generate blacklight --devise

#create blacklight db
/usr/local/bin/rake db:migrate

#solr install
if [ ! -f jetty/start.jar ]; then
  /usr/local/bin/rails generate blacklight:jetty
fi
(cd jetty; /usr/bin/java -jar start.jar) > solr.log 2>&1 &
sleep 30s # give solr some time to actually start

#index some data
/usr/local/bin/rake solr:marc:index_test_data > marc.log 2>&1 &
  
#start rails server
/usr/local/bin/rails server > blacklight.log 2>&1 &