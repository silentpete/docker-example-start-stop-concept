FROM alpine:latest

ENV FUNCTIONS="/opt/app_name/functions/"

COPY /root_d /

CMD ["/bin/sh", "/opt/app_name/initialize.sh"]
