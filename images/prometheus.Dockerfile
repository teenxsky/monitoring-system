FROM alpine:latest AS builder

ARG PROMETHEUS_HOST
ARG PROMETHEUS_PORT

RUN apk add --no-cache gettext
COPY ./conf/prometheus/prometheus.yml /prometheus.yml.template
RUN envsubst < /prometheus.yml.template > /prometheus.yml


FROM prom/prometheus:v3.4.1 AS final

COPY --from=builder /prometheus.yml /etc/prometheus/prometheus.yml
COPY ./conf/prometheus/rules.yml /etc/prometheus/rules.yml
