#!/bin/bash

#
## Can add all initialization scripts to a start method.
#
## These should initialize whether started for the:
## - first time running
## - if restarted
## - if stoped, removed and started
## - if failure
#
## build intelligent functions

start_app() {
  info "starting ${APP_NAME}"
  # specific app start concept
  cd ${APP_HOME}
  ./start_service.sh
}
