# == Class: sshd
#
# Puppet management of sshd
#
# === Parameters
#
# None AFAIK
#
# === Variables
#
# None AFAIK
#
# === Authors
# CiS 399, 2015, Team Minions
# Lily Moch <moch@uoregon.edu>
#

class sshd {
	package {
		"ssh": ensure => installed;
	}

	file { "/etc/ssh/sshd_config":
		source => [
			"/etc/ssh/sshd_config",
		],
		mode    => 444,
		owner   => root,
		group   => root,
		# package must be installed before config file
		require => Package["ssh"],
	}

	service {"sshd":
		# automatically start at boot time
		enable => true,
		# restart service if not running
		ensure => running,
		# "service sshd status" returns useful status info
		hasstatus => true,
		# can restart service
		hasrestart => true,
		# package and configuration must be present for service
		require => [ Package["ssh"],
					 File["/etc/ssh/sshd_config"] ],
		# if you change the configuration, cause service to restart
		subscribe => File["/etc/ssh/sshd_config"],
	}
}
