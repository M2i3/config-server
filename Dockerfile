#
# config-server
#
# A simple HTTPS configuration server using Client Certificates for authentication. 
#

FROM nginx:1.9
MAINTAINER Jean-Marc Lagace <jean-marc@m2i3.com>
COPY default.conf /etc/nginx/conf.d/default.conf

