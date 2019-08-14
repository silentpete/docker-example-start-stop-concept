FROM centos:7.6.1810

ARG APP="app_name"

ENV \
  APP_NAME="${APP}" \
  APP_HOME="/opt/${APP}" \
  FUNCTIONS="/opt/init.d/functions.d/"

COPY /root.d /

HEALTHCHECK --interval=15s --timeout=3s --start-period=1s --retries=3 CMD ["/opt/init.d/functions.d/healthcheck.sh", "test"]

ENTRYPOINT ["/bin/bash"]

CMD ["/opt/init.d/initialize.sh"]
