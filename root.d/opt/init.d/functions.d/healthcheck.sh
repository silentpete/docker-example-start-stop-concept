#!/bin/bash

# healthcheck is used to check that the app is running. pass it a value to run the command.
#
# Using the grep count of the process that should be running. Note bracketing the "s" like
# [s] will stop finding the grep command which would then be a count of 2 if everything is working as expected.
function healthcheck() {
  if [[ $(ps -ef | grep -c "[s]tart_service.sh") -eq 1 ]]; then
    echo 0
  else
    echo 1
  fi
}

if [[ -n $1 ]]; then
  healthcheck
fi
