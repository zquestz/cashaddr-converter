FROM golang:alpine
RUN mkdir -p /go/src/github.com/zquestz/cashaddr-converter/
WORKDIR /go/src/github.com/zquestz/cashaddr-converter/
COPY . .
RUN go install github.com/zquestz/cashaddr-converter/cmd/svc@latest
FROM alpine
COPY --from=0 /go/bin/svc /svc
COPY --from=0 /go/src/github.com/zquestz/cashaddr-converter/static /static
CMD ["/svc"]