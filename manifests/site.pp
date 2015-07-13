#Dave's node
node ip-10-0-9-234 {

}

# Lily's node
node ip-10-0-9-201 {

}

# Mufassa's node
node ip-10-0-9-51 {

}

# puppet master node
node ip-10-0-9-213 {
    cron { "puppet update":
        command => "cd /etc/puppet && git pull -q origin master",
	user    => root,
	minute  => "*/5",
    }
}
