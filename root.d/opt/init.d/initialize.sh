#!/bin/bash

function info () {
  echo -e "\e[32mtime=\"$(date --rfc-3339='seconds')\" level=info msg=\"${@}\"\e[0m"
}

function warn () {
  echo -e "\e[33mtime=\"$(date --rfc-3339='seconds')\" level=warn msg=\"${@}\"\e[0m"
}

function error () {
  echo -e "\e[31mtime=\"$(date --rfc-3339='seconds')\" level=error msg=\"${@}\"\e[0m"
  exit 1
}

if [[ -z ${FUNCTIONS} ]]; then
  error "The FUNCTIONS environment variable must be set and not be empty."
fi

info "initializing..."

for file in $(find "${FUNCTIONS}" -mindepth 1 -maxdepth 1 -type f -name '*.sh' | sort); do
  info "sourcing functions file: $(basename ${file})"
  source $file
  status=$?
  if [[ status -ne 0 ]]; then
    error "An error occurred sourcing function file: $(basename ${file})."
  fi
done

type start >/dev/null
status=$?
if [[ status -ne 0 ]]; then
  error "Could not locate a 'start' method after your libraries were sourced. " \
       "Please ensure one of your libraries implements a start method."
fi

type stop >/dev/null
status=$?
if [[ status -ne 0 ]]; then
  error "Could not locate a 'stop' method after your libraries were sourced. " \
       "Please ensure one of your libraries implements a stop method."
fi

start

trap 'stop' SIGTERM
while true; do read; done
