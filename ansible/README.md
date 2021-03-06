Ansible
=======

Introduction
------------

* yml playbook (python)
* install from
 * os package
 * git (seems common)
 * python package index
* cmd
 * ansible
  * ping
 * ansible-playbook -i hosts basic-playbook-1.yml
  * shows changed
  * can override vars on command line
* host inventory (local or hosted)
 * group [web]
   * could be purpose, location, etc
 * server webserver-1.example.com
 * or ranges webserver-[a-b].example.com
* playbooks
 * plays
  * tasks 
   * top down execution
   * modules: yum, service, template, etc
* interacts with servers over ssh, respects role permissions
* Currently Ansible can be from any machine with Python 2.6 installed (Windows isn't supported for the control machine).
 * This includes Red Hat, Debian, CentOS, OS X, any of the BSDs, and so on.

Getting started 
===============

vagrant box add centos6.5 /path/to/golden_centos65-x86_64.box
vagrant up	# creates a control and node vm
(vagrant ssh)
/vagrant/test.sh 	# tests to see if dependencies are installed

Requires
--------
Vagrant (with vagrant-hostupdater)

Details
=======

* Functionality
 * Modules for normal things http://docs.ansible.com/list_of_all_modules.html
  * apt, yum, etc
  * gem
  * copy

* Cloud Integration
 * VMware
 * OpenStack
 * Amazon Web Services EC2 (AWS)
 * Eucalyptus Cloud
 * KVM
 * CloudStack
 
* Control Machine
 * This includes Red Hat, Debian, CentOS, OS X, any of the BSDs, and so on.
 
* Network Effect
 * openssh :22
 * always know servers in advance?
 * external way to get ssh credentials on box

