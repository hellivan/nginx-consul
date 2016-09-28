#!/bin/sh

CONSUL_URL=${CONSUL_HOST}:${CONSUL_PORT}

echo Starting consul-template for consul @ ${CONSUL_URL}

consul-template \
    -consul="${CONSUL_URL}" \
    -template="/etc/ctmpl/nginx.conf.ctmpl:/etc/nginx/nginx.conf" \
    -exec="/usr/sbin/nginx -g 'daemon off;'"
