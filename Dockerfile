FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt -y install apache2
RUN apt install apache2-utils
RUN apt -y install   php7.4
RUN apt -y install  php7.4-fpm
RUN apt -y install  php7.4-mysql
RUN apt -y install  libapache2-mod-php7.4
RUN apt update
COPY . /var/www/html
EXPOSE 80
CMD /usr/sbin/apachectl -DFOREGROUND
