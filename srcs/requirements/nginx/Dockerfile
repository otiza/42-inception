FROM debian:buster

RUN apt-get update \
	&& apt-get install -y vim \
	&& apt-get install -y wget \
	&& apt-get install -y unzip \
	&& apt-get install -y net-tools
RUN apt-get -y install nginx
ADD conf/default /etc/nginx/sites-available/
ADD tools/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
ADD tools/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
CMD ["nginx", "-g", "daemon off;"]