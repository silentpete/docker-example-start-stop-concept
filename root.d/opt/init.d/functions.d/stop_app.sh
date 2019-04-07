#!/bin/bash

stop_app() {
  info "stopping ${APP_NAME}"
  # stop all processes with
  cd ${APP_HOME}
  ./stop_service.sh
  rc=$?
  if [[ $rc -ne 0 ]]; then
    error "stop_service.sh did not exit correctly"
  fi
}
