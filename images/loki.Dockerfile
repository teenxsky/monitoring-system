FROM grafana/loki:2.9.0

COPY ./conf/loki.yaml /etc/loki/loki.yaml
