FROM alpine:latest AS builder

ARG ALERTMANAGER_TG_CHAT_ID
ARG ALERTMANAGER_TG_BOT_TOKEN

RUN apk add --no-cache gettext

COPY ./conf/alertmanager/alertmanager.yml /alertmanager.yml.template
RUN envsubst < /alertmanager.yml.template > /alertmanager.yml


FROM prom/alertmanager:v0.28.1 AS final

COPY --from=builder /alertmanager.yml /etc/alertmanager/alertmanager.yml
COPY ./conf/alertmanager/tg.tmpl /etc/alertmanager/tg.tmpl
