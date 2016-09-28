#!/bin/sh

CONSUL_URL=${CONSUL_HOST}:${CONSUL_PORT}

echo Starting consul-template for consul @ ${CONSUL_URL}

consul-template \
    -consul="http://${CONSUL_URL}:8500" \
    -template="/etc/ctmpl/nginx.conf.ctmpl:/etc/nginx/nginx.conf" \
    -exec="/usr/sbin/nginx -g 'daemon off;'"
