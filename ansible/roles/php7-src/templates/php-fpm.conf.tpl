[global]
pid = /run/php7-fpm.pid
error_log = /var/log/php7-fpm.log

[www]
user = {{ php7-src.fpm.user }}
group = {{ php7-src.fpm.group }}

listen = 127.0.0.1:9000

pm = dynamic
pm.max_children = 10
pm.start_servers = 4
pm.min_spare_servers = 2
pm.max_spare_servers = 6
