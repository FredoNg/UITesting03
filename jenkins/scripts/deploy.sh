#!/usr/bin/env sh

set -x
docker run -d -p 10.1.5.22:8000:80 --name my-apache-php-app -v $WORKSPACE/src:/var/www/html php:7.2-apache
sleep 1
set +x

echo 'Now...'
echo 'Visit http://18.222.75.64:8000 to see your PHP application in action.'
