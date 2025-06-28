FROM alpine:latest AS builder

ARG NGINXLOG_PORT

RUN apk add --no-cache gettext

COPY ./conf/nginxlog-exporter.hcl /nginxlog-exporter.hcl.template
RUN envsubst '${NGINXLOG_PORT}' < /nginxlog-exporter.hcl.template > /nginxlog-exporter.hcl


FROM quay.io/martinhelmich/prometheus-nginxlog-exporter:v1
COPY --from=builder /nginxlog-exporter.hcl /etc/nginxlog/nginxlog-exporter.hcl
