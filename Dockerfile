FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt -y install apache2
RUN apt install apache2-utils
RUN apt update
RUN apt install software-properties-common -y
RUN apt update
RUN add-apt-repository ppa:ondrej/php -y
RUN apt install php7.4 -y
RUN apt install php7.4 php7.4-cli php7.4-fpm php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath -y
RUN apt -y install php7.4-mysql
RUN apt -y install libapache2-mod-php7.4
RUN apt update
# Create a directory to hold the Apache configuration files
RUN mkdir /apache-conf

# Copy the Apache configuration files from the host machine to the build context
COPY apache2.conf /apache-conf/
COPY ports.conf /apache-conf/
COPY sites-available/ /apache-conf/sites-available/

# Copy the Apache configuration files from the build context to the Docker image
RUN cp /apache-conf/apache2.conf /etc/apache2/
RUN cp /apache-conf/ports.conf /etc/apache2/
RUN cp -R /apache-conf/sites-available/* /etc/apache2/sites-available/

COPY . /var/www/html/Employee-Management-System
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
#CMD /usr/sbin/apachectl -DFOREGROUND
