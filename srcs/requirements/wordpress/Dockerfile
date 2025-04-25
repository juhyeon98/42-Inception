FROM debian:11.0

RUN mkdir -p /run/php;
RUN mkdir -p /var/www/html;
RUN apt-get update && apt-get upgrade -y;
RUN apt-get install -y php-fpm php-mysql;
RUN apt-get install -y wget;

COPY tools/run.sh /etc/php/run.sh

ENTRYPOINT [ "/bin/bash", "/etc/php/run.sh" ]