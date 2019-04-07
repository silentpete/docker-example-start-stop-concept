FROM centos:7.6.1810

ARG APP="app_name"

ENV \
  APP_NAME="${APP}" \
  APP_HOME="/opt/${APP}" \
  FUNCTIONS="/opt/init.d/functions.d/"

COPY /root.d /

ENTRYPOINT ["/bin/bash"]

CMD ["/opt/init.d/initialize.sh"]
