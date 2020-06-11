FROM alpine:latest

RUN apk add --no-cache netcat-openbsd

ENTRYPOINT ["/usr/bin/nc"]
