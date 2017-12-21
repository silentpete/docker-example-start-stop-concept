#!/bin/sh

#
## Can add all initialization scripts to a start method.
#
## These should initialize whether started for the:
## - first time running
## - if restarted
## - if stoped, removed and started
#
## build intelligent functions

start_app() {
  info "starting"
  # specific app start concept
  # cd /app/dir
  # ./bin/start-app.sh
}

start() {
  # Uncomment to check_environment to see error message
  #check_environment
  config_app
  send_logs_to_stdout
  start_app
}
