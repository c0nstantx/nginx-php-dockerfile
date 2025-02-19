#!/bin/bash
set -e -x
#echo "starting supervisor in foreground"
if [ ! -z "$LOGSTASH_IP" ] && [ ! -z "$LOGSTASH_HOST" ]; then
    echo "${LOGSTASH_IP} ${LOGSTASH_HOST}" >> /etc/hosts
fi
if [ "$ENVIRONMENT" == "stage" ]; then
    cp /etc/nginx/conf.d/default.conf.stage /etc/nginx/conf.d/default.conf
elif [ "$ENVIRONMENT" == "dev" ]; then
    cp /etc/nginx/conf.d/default.conf.dev /etc/nginx/conf.d/default.conf
fi
/usr/sbin/php5-fpm
supervisord -n
