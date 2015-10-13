FROM nginx:1.9
COPY default.conf /etc/nginx/conf.d/default.conf
#docker run -d -p 49155:443 --name m2i3app--config.0 -v `pwd`/certs:/etc/nginx/certs:ro m2i3/config
