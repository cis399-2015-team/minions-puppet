class postfix
{
	package 
	{
		"postfix": ensure => installed;
	}

	file
	{
		"/etc/postfix/main.cf": 
		source => "puppet:///modules/postfix/main.cf",

		mode => 444,
 		owner => "root",
		group => "root",

		require => Package["postfix"],	
	}
}
