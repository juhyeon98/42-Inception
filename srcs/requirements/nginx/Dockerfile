FROM debian:11.0

RUN apt-get update && apt-get upgrade -y;
RUN apt-get install -y nginx openssl;

COPY conf/default /etc/nginx/sites-available/default
COPY tools/run.sh /etc/nginx/run.sh
RUN chmod +x /etc/nginx/run.sh

WORKDIR /var/www/html

ENTRYPOINT [ "/bin/bash", "/etc/nginx/run.sh" ]

