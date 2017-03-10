FROM nginx:1.11.4-alpine

ENV CONSUL_HOST consul
ENV CONSUL_PORT 8500

ENV TMPL_DIR /etc/ctmpl
ENV CONSUL_TEMPLATE_VERSION 0.16.0


ADD ./nginx.conf.ctmpl ${TMPL_DIR}/nginx.conf.ctmpl
ADD ./start.sh /root/start.sh


EXPOSE 80 443

VOLUME ${TMPL_DIR}

RUN apk update &&\
    apk add --no-cache curl bash&&\
    cd /tmp &&\
    curl https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip -o consul-template.zip &&\
    unzip consul-template.zip &&\
    rm -f consul-template.zip &&\
    mv consul-template /usr/local/bin/
    


ENTRYPOINT ["sh", "/root/start.sh"]