FROM golang:1.12-alpine

RUN apk add --no-cache git ca-certificates
RUN go get github.com/mattn/goveralls

FROM golang:1.12-alpine

RUN apk add --no-cache git

COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=0 /go/bin/goveralls /usr/bin/goveralls

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]