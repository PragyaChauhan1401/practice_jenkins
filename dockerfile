FROM ubuntu:latest

WORKDIR /app
RUN apt-get update && apt-get install -y apache2

COPY . /var/www/html/

EXPOSE 82

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]