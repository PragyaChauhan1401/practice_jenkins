FROM ubuntu:latest

WORKDIR /app

COPY . /var/www/html/

EXPOSE 82

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]