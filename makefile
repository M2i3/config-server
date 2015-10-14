DYNAMICPORT=$(shell mappc get-port)

build:
	docker build -t m2i3/config ./
	
up:
	docker run -d -p $(DYNAMICPORT):443 --name m2i3app--dev-config.0 -v `pwd`/certs:/etc/nginx/certs:ro -v `pwd`/sample-html-config:/usr/share/nginx/html:ro  m2i3/config
	@echo running on port $(DYNAMICPORT)
	
down:
	! mappc is-container m2i3app--dev-config.0 || docker rm -fv m2i3app--dev-config.0
	
create-test-data:
	mkdir -p certs
	mkdir -p sample-html-config

	# create the CA key and cert
	cd certs && openssl genrsa -out ca.key 4096
	cd certs && openssl req -new -x509 -subj "/CN=ca.test.m2i3app.dev"  -days 365 -key ca.key -out ca.crt
	
	# create the server key and cert
	cd certs && openssl genrsa -out server.key 2024
	cd certs && openssl req -new -subj "/CN=config.test.m2i3app.dev" -sha256 -key server.key -out server.csr
	# sign server certificate request
	cd certs && openssl x509 -req -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt
	
	# create the client key and cert
	cd certs && openssl genrsa -out client.key 1024
	cd certs && openssl req -new -subj "/CN=client1.test.m2i3app.dev" -sha256 -key client.key -out client.csr
	# sign the client certificate request
	cd certs && openssl x509 -req -days 365 -in client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out client.crt
	
