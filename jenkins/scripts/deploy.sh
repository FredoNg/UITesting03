#!/usr/bin/env sh

set -x
docker run -d -p 8000:80 --name my-apache-php-app -v $WORKSPACE/src:/var/www/html php:7.2-apache
sleep 1
set +x

echo 'Now...'
echo 'Visit http://192.168.220.130:80 to see your PHP application in action.'

jenkins/scripts/deploy.sh