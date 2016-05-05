FROM fnphat/alpine-java:1.8.0

# Install prerequisites
RUN apk update && \
    apk add openssl && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

# Install openHAB
RUN wget -O /tmp/runtime.zip https://bintray.com/artifact/download/openhab/bin/distribution-1.8.1-runtime.zip && \
    wget -O /tmp/addons.zip https://bintray.com/artifact/download/openhab/bin/distribution-1.8.1-addons.zip && \
    mkdir /openhab && \
    unzip /tmp/runtime.zip -d /openhab && \
    unzip /tmp/addons.zip org.openhab.action.mios-1.8.1.jar -d /openhab/addons && \
    rm /tmp/runtime.zip /tmp/addons.zip

ENTRYPOINT bash
