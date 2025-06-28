FROM grafana/promtail:2.9.0

COPY ./conf/promtail.yaml /etc/promtail/promtail.yaml
