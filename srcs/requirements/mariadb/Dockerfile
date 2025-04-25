FROM debian:11.0

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY tools/run.sh /etc/mysql/run.sh
RUN chmod +x /etc/mysql/run.sh

ENTRYPOINT [ "/bin/bash", "/etc/mysql/run.sh" ]