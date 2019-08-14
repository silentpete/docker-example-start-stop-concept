#!/bin/bash

function debug_msg() {
  case ${MSG_LEVEL,,} in
    "debug")
      echo -e "\e[36mtime=\"$(date --rfc-3339='seconds')\" level=info msg=\"${@}\"\e[0m";;
  esac
}

function info_msg() {
  case ${MSG_LEVEL,,} in
    "debug"|"info")
      echo -e "\e[32mtime=\"$(date --rfc-3339='seconds')\" level=info msg=\"${@}\"\e[0m";;
  esac
}

function warn_msg() {
  case ${MSG_LEVEL,,} in
    "debug"|"info"|"warn")
      echo -e "\e[33mtime=\"$(date --rfc-3339='seconds')\" level=warn msg=\"${@}\"\e[0m";;
  esac
}

function error_msg() {
  echo -e "\e[31mtime=\"$(date --rfc-3339='seconds')\" level=error msg=\"${@}\"\e[0m"
  exit 1
}

MSG_LEVEL=${MSG_LEVEL:-info}
case ${MSG_LEVEL} in
  "debug"|"info"|"warn"|"error")
    debug_msg "MSG_LEVEL=${MSG_LEVEL}";;
  *)
    error_msg "MSG_LEVEL=${MSG_LEVEL}, allowed values are debug, info, warn, error";;
esac

if [[ -z ${FUNCTIONS} ]]; then
  error_msg "The FUNCTIONS environment variable must be set and not be empty."
fi

info_msg "Initializing..."

for file in $(find "${FUNCTIONS}" -mindepth 1 -maxdepth 1 -type f -name '*.sh' | sort); do
  debug_msg "sourcing functions file: $(basename ${file})"
  source ${file}
  status=$?
  if [[ ${status} -ne 0 ]]; then
    error_msg "An error occurred sourcing function file: $(basename ${file})."
  fi
done

debug_msg "checking start function exists"
type start >/dev/null
status=$?
if [[ ${status} -ne 0 ]]; then
  error_msg "Could not locate a 'start' method after your libraries were sourced. " \
            "Please ensure one of your libraries implements a start method."
fi

debug_msg "checking stop function exists"
type stop >/dev/null
status=$?
if [[ ${status} -ne 0 ]]; then
  error_msg "Could not locate a 'stop' method after your libraries were sourced. " \
            "Please ensure one of your libraries implements a stop method."
fi

start

trap 'stop' SIGTERM
while true; do read; done
