 file {'/etc/yum.repos.d/nginx.repo':
      source => "/home/vagrant/cm-evaluation/puppet/modules/nginx/files/nginx.repo",
      mode => 0644,
      owner => vagrant,
      group => vagrant
    }

  package {
    "nginx":
       ensure => present
  }

