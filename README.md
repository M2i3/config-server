# config-server

A simple HTTPS configuration server using Client Certificates for authentication. 

The server prevents listing the base locations to avoid leading configuration of all environments.

## Requirements

This configuration is designed with Docker in mind and requires the [m2i3app-client](https://hub.docker.com/r/m2i3/m2i3app-client/) to be utilized.

## Test Certificates and Keys
The generation of the test certificates and keys are based on an article about [Client Side Certificate Auth in Nginx](http://nategood.com/client-side-certificate-authentication-in-ngi).

The keys can be generated with "make create-certs". The container depends on it in order to execute the tests.

