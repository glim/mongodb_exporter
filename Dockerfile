FROM golang:1.8
WORKDIR /go/src/github.com/percona/mongodb_exporter/
COPY . .
RUN make

FROM        quay.io/prometheus/busybox:latest
MAINTAINER  Alexey Palazhchenko <alexey.palazhchenko@percona.com>

COPY --from=0 /go/src/github.com/percona/mongodb_exporter/mongodb_exporter /bin/mongodb_exporter

EXPOSE      9216
ENTRYPOINT  [ "/bin/mongodb_exporter" ]
