#!/usr/bin/env sh

set -x
docker run -d -p 192.168.220.130:80:80 --name my-apache-php-app -v /home/fred/UITesting03/src:/var/www/html php:7.2-apache
sleep 1
set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'

