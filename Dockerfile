FROM golang:latest
MAINTAINER Matt Vincent

# When this Dockerfile was last refreshed (year/month/day)
ENV REFRESHED_AT 2017-02-12
ENV OAUTH2_PROXY_VERSION 2.2.0

# Checkout google-auth-proxy code from Github sourceallies/oauth2_proxy-1
ADD https://github.com/sourceallies/oauth2_proxy-1/releases/download/v2.2.0/oauth2_proxy-2.2.0.linux-amd64.go1.6.tar.gz /tmp
RUN tar -xf /tmp/oauth2_proxy-2.2.0.linux-amd64.go1.6.tar.gz -C ./bin --strip-components=1 && rm /tmp/*.tar.gz

# Expose the ports we need and setup the ENTRYPOINT w/ the default argument
# to be pass in.
EXPOSE 8080 4180
ENTRYPOINT [ "./bin/oauth2_proxy" ]
CMD [ "--upstream=http://0.0.0.0:8080/", "--http-address=0.0.0.0:4180" ]
