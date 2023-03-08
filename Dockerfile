FROM alpine:latest

RUN apk add curl jq

COPY ./updateip /usr/bin/updateip

RUN chmod +x /usr/bin/updateip
