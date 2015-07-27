#Dave's node
node ip-10-0-9-234 {
	include sshd
	include web-server
	include postfix
}

# Lily's node
node ip-10-0-9-201 {
	include sshd
	include web-server
}

# Mufassa's node
node ip-10-0-9-51 {
	include sshd
	include web-server
}

# puppet master node
node ip-10-0-9-213 {
    include sshd
	include web-server

    cron { "puppet update":
        command => "cd /etc/puppet && git pull -q origin master",
	user    => root,
	minute  => "*/5",
    }
}
