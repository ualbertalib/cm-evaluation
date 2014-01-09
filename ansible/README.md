Ansible
=======

Introduction
------------

* yml playbook
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

Getting started 
===============

vagrant up

Requires
--------
Vagrant (with vagrant-hostupdater)

