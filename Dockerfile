ARG VERSION=20.04
FROM ubuntu:${VERSION}
MAINTAINER sandeep@gmail.com
LABEL production="maintainerk"
RUN apt update  && apt install iproute2 iputils-ping -y nginx
WORKDIR /usr/share/nginx/html
COPY index.html .
WORKDIR /var/www/html
ADD index.html .
EXPOSE 80
ENV ROOT_USER_PASSWORD=123434
VOLUME /var/www/html
ENTRYPOINT ["nginx","-g","daemon off;"]
CMD ["ls -al"]
HEALTHCHECK CMD curl -fail http://localhost:80 || exit 1



