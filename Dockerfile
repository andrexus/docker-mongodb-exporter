FROM alpine

ARG APP_VERSION=0.4.0

LABEL maintainer="Andrew Tarasenko andrexus@gmail.com"

ADD https://github.com/andrexus/docker-mongodb-exporter/releases/download/v$APP_VERSION/mongodb_exporter /bin/mongodb_exporter

RUN chmod +x /bin/mongodb_exporter

EXPOSE      9216

ENTRYPOINT  [ "/bin/mongodb_exporter" ]
