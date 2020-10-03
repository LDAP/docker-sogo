Based on https://github.com/mailcow/mailcow-dockerized/tree/master/data/conf/sogo

Mount volumes /etc/sogo and /sogo_backup.
Add to config file and/or use https://github.com/mailcow/mailcow-dockerized/blob/master/data/conf/sogo/sogo.conf as starting point.
WOPort = "0.0.0.0:20000";
WOLogFile = "/dev/sogo_log";
WONoDetach = YES;