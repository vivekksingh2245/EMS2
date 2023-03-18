FROM ubuntu
RUN apt-get update
RUN apt-get -y install apache2
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install apache2-utils
RUN apt-get install -y  php 
RUN apt-get install -y libapache2-mod-php
RUN apt-get install -y php-mysql
RUN apt-get update
COPY . /var/www/html
EXPOSE 80
CMD /usr/sbin/apachectl -DFOREGROUND
