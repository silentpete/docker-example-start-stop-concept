#!/bin/bash
touch service.log

function service_start() {
  echo "starting service" > service.log
  while true; do
    echo "service is running and logging..." >> service.log
    sleep 2
  done
}

service_start &
