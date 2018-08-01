FROM centos:7.5.1804

ENV FUNCTIONS="/opt/app_name/functions/"

COPY /root_d /

CMD ["/bin/bash", "/opt/app_name/initialize.sh"]
