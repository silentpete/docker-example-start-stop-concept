#!/bin/bash

function stop_app() {
  info_msg "Stopping ${APP_NAME}"
  # stop all processes with
  cd ${APP_HOME}
  ./stop_service.sh
  rc=$?
  if [[ $rc -ne 0 ]]; then
    error_msg "stop_service.sh did not exit correctly"
  fi
}
