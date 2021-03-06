# php7-fpm - The PHP FastCGI Process Manager
# Original script by Ondřej Surý. Adapted to php7-fpm by @bjornjohansen

description "The PHP FastCGI Process Manager"
author "Ondřej Surý <ondrej@debian.org>"

start on runlevel [2345]
stop on runlevel [016]

# Precise upstart does not support reload signal, and thus rejects the
# job. We'd rather start the daemon, instead of forcing users to
# reboot https://bugs.launchpad.net/ubuntu/+source/php5/+bug/1272788
#
# reload signal USR2


pre-start exec /usr/local/lib/php7-fpm-checkconf

respawn
exec /usr/local/php7/sbin/php-fpm --nodaemonize --fpm-config {{ php7-src.prefix }}/etc/php-fpm.conf
