# == Class: mysql-server
#
# Puppet management of MySQL Server version 5.6
#
# == Authors
# CiS 399, 2015, Team Minions
# Lily Moch <moch@uoregon.edu>
#

class mysql-server {
    package {
		"mysql-server": ensure => installed;		
		"phpmyadmin": ensure => installed;
	}

	file { "/etc/mysql/my.cnf":
		source  => [
			"puppet:///modules/mysql-server/$hostname/mysql-server_config",
			"puppet:///modules/mysql-server/mysql-server_config",
		],
		mode    => 600,
		owner   => ubuntu,
		group   => ubuntu,
		# package must be installed before config file
		require => Package["mysql-server"],
	}

	service {"mysql":
		# automatically start at boot time
		enable     => true,
		# restart service if not running
		ensure     => running,
		# "service mysql status returns useful status info
		hasstatus  => true,
		# can restart service
		hasrestart => true,
		# package and configuration must be present for service
		require    => [ Package["mysql-server"],
					 File["/etc/mysql/my.cnf"] ],
		# if you change the configuration, cause service to restart
		subscribe  => File["/etc/mysql/my.cnf"],
	}
}
