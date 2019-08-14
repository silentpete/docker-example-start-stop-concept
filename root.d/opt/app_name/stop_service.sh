#!/bin/bash

function stop_service() {
  echo "received stop command, shutting down service" >> service.log
  running="true"
  while ${running}; do
    pid=$(pgrep -f 'start_service.sh')
    kill -15 $pid
    rc=$?
    if [[ $rc -ne 0 ]]; then
      echo -e "stopping service returned code: ${rc}" >> service.log
    fi
    if [[ $(ps -ef | grep -c "[s]tart_service") -gt 0 ]]; then
      echo "still running, shutting down service" >> service.log
      sleep 1
    else
      running="false"
    fi
  done
}

stop_service
