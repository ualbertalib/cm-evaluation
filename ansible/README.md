Ansible
=======

Introduction
------------

* yml playbook (python)
* install from
 * os package
 * git
 * python package index
* cmd
 * ansible
  * ping
 * ansible-playbook basic-playbook-1.yml
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
	* modules: yum, service, template
* interacts with servers over ssh, respects role permissions
* Currently Ansible can be from any machine with Python 2.6 installed (Windows isn’t supported for the control machine).
 * This includes Red Hat, Debian, CentOS, OS X, any of the BSDs, and so on.

Getting started 
===============

vagrant up

Requires
--------
Vagrant (with vagrant-hostupdater)

Details
=======

* Cloud Integration
 * VMware
 * OpenStack
 * Amazon Web Services EC2 (AWS)
 * Eucalyptus Cloud
 * KVM
 * CloudStack

