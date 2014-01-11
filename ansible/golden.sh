#!/bin/sh

sudo yum -y upgrade

rpm -qa | sort > this.txt

grep -vif /vagrant/golden.txt this.txt > extra.txt
grep -vi kernel extra.txt > extra2.txt
grep -vif this.txt /vagrant/golden.txt > missing.txt
grep -vi kernel missing.txt > missing2.txt

sudo yum -y install $(cat missing2.txt)
sudo yum -y remove $(cat extra2.txt)

rpm -qa | sort > this.txt

echo "remaining differences"
diff -u /vagrant/golden.txt this.txt