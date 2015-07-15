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
		"openssh-server": ensure => installed;
	}
	
	ssh_authorized_key { "lily-key":
		user => "ubuntu",
		key  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCd2UtlFwFhdJtWv6qGvAzrt50yeOLp9hICZmfCQ8cMWXmu7u6bYlMXFtjLhdYOOIc8lROnB8c38DiiOoUitP3BfCXlCCAH6aEA1Je1GvgewuplSm0f/uv5kx0+oa5Dq1KaZ5n6+UUA3HR5eMohQAosr49Y7Mf0h7OasAkZMxCJAuU/h5ytraR21YpN46GDwuTdp9N5mRrROy7OB2TC+hLj4/RCaL+K84j/v1TnDiI5MTS91anC0TBIfCnN3s/MTEh29bu5GYLjtOU2Ti/gBlZylc8CAjr3viqmt0+jTvk11pfx+R8zux7hMLu7qCGfkmwJ0LAB4HxPmPbEzpf7Ki1r",
	}

	ssh_authorized_key { "Mufassa-key":
		user => "ubuntu",
		key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCJGcGt69dL6mwivXm1eosJwhA4uNU7VG7bzJdggBFcj4XpGZWXUlJAQE6OMalkvYL91laJM2p/yzF6pFyNZCUsHj53Ef8Fg7hWPpfgtPu1/WOebU7td86T8n0iCuAkYAHtCPyEd4B2eAOwutydRx/0ZNqNBAZnY/oJeGd+3Mxy0vRGtqVQRX1hMl5OjEXZ2i39XppnNMpVCoGsMjcG/6eYvD+KHjip29FfChfjNlVmNaKQQJSPaFQ3wT+UQ+Mobpkt5tI2WcBJIsQ8CB2qKZKbgsHMA8sN9o7vVZY7oz7T01nH3G4xvZtyMfgg0qnTjiICzLsl++n0OtuiZafrQXS9",
	}

	file { "/etc/ssh/sshd_config":
		source => [
			"puppet:///modules/sshd/$hostname/sshd_config",
			"puppet:///modules/sshd/sshd_config",
		],
		mode    => 600,
		owner   => ubuntu,
		group   => ubuntu,
		# package must be installed before config file
		require => Package["openssh-server"],
	}

	service {"ssh":
		# automatically start at boot time
		enable => true,
		# restart service if not running
		ensure => running,
		# "service ssh status" returns useful status info
		hasstatus => true,
		# can restart service
		hasrestart => true,
		# package and configuration must be present for service
		require => [ Package["openssh-server"],
					 File["/etc/ssh/sshd_config"] ],
		# if you change the configuration, cause service to restart
		subscribe => File["/etc/ssh/sshd_config"],
	}
}
