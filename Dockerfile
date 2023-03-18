FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt -y install apache2
RUN apt install apache2-utils
RUN apt install -y  php7.4
RUN apt install -y  php7.4-fpm
RUN apt install -y php7.4-mysql
RUN apt install -y libapache2-mod-php7.4
RUN apt update
COPY . /var/www/html
EXPOSE 80
CMD /usr/sbin/apachectl -DFOREGROUND
