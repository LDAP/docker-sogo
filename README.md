# Sogo Docker

Based on https://github.com/mailcow/mailcow-dockerized/tree/master/data/conf/sogo

## Configuration
- Mount volumes /etc/sogo and /sogo_backup.
- Edit configuration file to your liking. At a mimimum add these values:
```
WOPort = "0.0.0.0:20000";
WOLogFile = "/dev/sogo_log";
WONoDetach = YES;
```
You can use https://github.com/mailcow/mailcow-dockerized/blob/master/data/conf/sogo/sogo.conf as starting point.
- An external reverse proxy is needed. Example configurations:
    + NGINX: http://wiki.sogo.nu/nginxSettings
    + Apache: https://github.com/inverse-inc/sogo/tree/master/Apache