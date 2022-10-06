FROM alpine:3.12

COPY apis.dev.aws.uk.tsb+4.pem /usr/local/share/ca-certificates/apis.dev.aws.uk.tsb+4.crt

RUN cat /usr/local/share/ca-certificates/apis.dev.aws.uk.tsb+4.crt >> /etc/ssl/certs/ca-certificates.crt

RUN apk --no-cache add curl libc6-compat gcompat
RUN addgroup -S sob-group && adduser -S sob-user -G sob-group

RUN mkdir -p "/opt/sob/config"

WORKDIR "/opt/sob"
COPY config config
COPY initialize .

RUN chmod 500 /opt/sob/initialize
RUN chown -R sob-user:sob-group /opt

USER sob-user
