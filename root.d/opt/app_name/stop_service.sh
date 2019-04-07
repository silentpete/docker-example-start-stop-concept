#!/bin/bash

stop_service() {
  echo "received stop command, shutting down service" >> service.log
  pid=$(pgrep -f 'start_service.sh')
  kill -15 $pid
  rc=$?
  if [[ $rc -ne 0 ]]; then
    echo -e "stopping service returned code: ${rc}" >> service.log
  fi
  sleep 1
}

stop_service
