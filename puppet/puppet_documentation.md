Documentation for Puppet Evaluation.

One of the distinctions we'll need to make is whether a given package should be part of the VM image or part of the Puppet manifest. Puppet (and Chef) are Rubygems, which means Ruby needs to be installed as part of the VM image, and can't be installed by Puppet (I think).

Ruby Installation
=================

Standard seems to be to install from source (which is what I'm doing), but as Fletcher pointed out, you can package the ruby binary if you want. The minimal Centos 6.4 from the vagrant site seems to have everything needed to install ruby 1.9.3 from source. I don't know if this will be the case with Neil's ultra-minimal 250-package Centos image. I want to start with 1.9.3 rather than 2.0, because we wanted to investigate upgrading through Puppet.

It looks as though installing from source with the default minimal packages. I'm going to try to update yum, then install the Development Tools first, then try again. OK, that worked (and may have worked before, but the path didnut update - needed to log out and in again).
Created "puppet" user with no home directory.
Installed the puppet gem (v. 2.7.12)
Played with puppet for a bit, then wrote a manifest to a) create the correct /etc/yum.repos.d/nginx.repo file and use yum to install nginx with it.
