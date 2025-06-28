FROM grafana/grafana:12.0.2

COPY ./conf/grafana/grafana.ini /etc/grafana/grafana.ini
COPY ./conf/grafana/provisioning/ /etc/grafana/provisioning/
