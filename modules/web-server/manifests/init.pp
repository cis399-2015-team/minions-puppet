# == Class: web-server
#
# Puppet management of apache2 http server version 2.4
#          & php5 with apache2 integration 
#
# == Authors
# CiS 399, 2015, Team Minions
# Lily Moch <moch@uoregon.edu>
#

class web-server {
    package {
		"apache2": ensure => installed;
		"php5": ensure => installed;
		"php5-mysql": ensure => installed;
		"libapache2-mod-php5": ensure => installed;		
		"libapache2-mod-auth-mysql": ensure => installed;
	}
	
	# To manage the configuration of php5 across instances
	file { '/etc/php5/apache2/conf.d':
		source => [
			"puppet:///modules/web-server/$hostname/php-config",
			"puppet:///modules/web-server/php-config",
		],
		ensure => directory,
		mode => 644,
		owner => ubuntu,
		group => ubuntu,
		recurse => true,
		require => Package["php5"],
		replace => true,
	}

	file { "/etc/apache2/apache2.conf":
		source  => [
			"puppet:///modules/web-server/$hostname/apache2_config",
			"puppet:///modules/web-server/apache2_config",
		],
		mode    => 600,
		owner   => ubuntu,
		group   => ubuntu,
		# package must be installed before config file
		require => Package["apache2"],
	}

    # To manage the apache2 DocumentRoots of each of our instances so we have consistant web content across instances.
    file { '/var/www/html':
		source => "puppet:///modules/web-server/html",
        # Make sure this is a directory
        ensure  => directory,
        mode    => 644,
        owner   => ubuntu,
        group   => ubuntu,
        # Recurse through the folder to synchronize everything
        recurse => true,
        # Would probably be wise to ensure apache exists? Might not be necessary.
        require => Package["apache2"],
        # One source, to rule them all
        replace => true,
    }

	service {"apache2":
		# automatically start at boot time
		enable     => true,
		# restart service if not running
		ensure     => running,
		# "service apache2 status returns useful status info
		hasstatus  => true,
		# can restart service
		hasrestart => true,
		# package and configuration must be present for service
		require    => [ Package["apache2"],
					 File["/etc/apache2/apache2.conf"] ],
		# if you change the configuration, cause service to restart
		subscribe  => File["/etc/apache2/apache2.conf"],
	}
}
