FROM alpine:3.6

ENV FUNCTIONS="/opt/app_name/functions/"

COPY /root /

CMD ["/bin/sh", "/opt/app_name/initialize.sh"]
