#!/bin/bash

function stop() {
  info_msg "received SIGTERM"
  stop_app
  info_msg "Graceful Shutdown"
  exit 0
}
