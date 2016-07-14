FROM fnphat/alpine-java:1.8.0

# Install prerequisites
RUN apk update && \
    apk add openssl && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

# Install openHAB
RUN wget -O /tmp/runtime.zip https://bintray.com/artifact/download/openhab/bin/distribution-1.8.1-runtime.zip && \
    mkdir /openhab && \
    unzip /tmp/runtime.zip -d /openhab && \
    rm /tmp/runtime.zip

ENTRYPOINT bash
