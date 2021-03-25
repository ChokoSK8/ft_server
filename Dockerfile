FROM debian:buster-slim

RUN apt-get -y update && apt-get -y install nginx \ 
	mariadb-server \ 
	wget \ 
	php \
	php-cli \	
	php-cgi \
	php-mbstring \
	php-fpm \
	php-mysql \
	libnss3-tools

COPY srcs ./root

WORKDIR /root

EXPOSE 80 443

CMD ["bash", "script.sh"]
